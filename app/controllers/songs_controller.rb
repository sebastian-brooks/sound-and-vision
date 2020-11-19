class SongsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:buy]
  before_action :authenticate_user!, except: [:buy, :index]
  before_action :check_role, only: [:new]
  before_action :check_artist, only: [:edit]
  before_action :check_block
  before_action :set_song, except: [:index, :new, :create]
  before_action :set_user_artists, only: [:new, :edit]
  before_action :set_genres, only: [:show, :edit, :update, :new]

  def index
    @songs = Song.paginate(page: params[:page], per_page: 9).includes(:genres, artist: :image_blob).order(:name)
  end

  def show
    @purchased = true if @song.purchases >= 1
    @user_owned = true if current_user.songs.include?(@song)
    @sole_owner = true if @song.users.size == 1 && @song.user_ids.include?(current_user.id)
    @song_genres = @song.genres.pluck(:name).join(", ")
  end

  def new
    @song = Song.new
  end

  def create
    song = Song.create(song_params)
    if song.id.nil?
      flash[:alert] = song.errors.full_messages.join(" | ").upcase
      redirect_to new_song_path(song)
    else
      redirect_to song_path(song)
    end
  end

  def edit
  end

  def update
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  def buy
    price = nil

    case params[:type].to_i
    when 1
      price = @song.price
    when 2
      price = @song.exclusive_price
    end
    
    Stripe.api_key = ENV['STRIPE_API_KEY']

    session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        mode: 'payment',
        customer_email: current_user.email,
        success_url: success_url(params[:id], params[:type]),
        cancel_url: cancel_url(params[:id]),
        line_items: [
          {
            price_data: {
              currency: 'aud',
              product_data: {
                name: "#{@song.name} - song by #{@song.artist.name}",
                description: @song.description,
                images: [url_for(@song.artist.image)]
              },
              unit_amount: (price.to_f * 100).to_i
            },
            quantity: 1
          }
        ]
    })

    render json: session
  end

  def success
    if params[:type] == "2" && @song.available
      @song.update_attribute(:available, false)
    end
    
    if current_user.songs.include?(@song)
      @song.increment!(:purchases)
      UserSong.create(user_id: current_user.id, song_id: @song.id)
      UserMailer.purchase_email(current_user, @song, params[:type]).deliver
      UserMailer.artist_purchase_notification(@song, params[:type]).deliver
    end
  end

  def cancel
  end

  private

  def set_song
    @song = Song.includes(:genres, artist: :image_blob).find(params[:id])
  end

  def set_user_artists
    @artists = Artist.where(user_id: current_user.id)
  end

  def set_genres
    @genres = Genre.all
  end

  def song_params
    params.require(:song).permit(:song_file, :name, :description, :price, :exclusive_price, :artist_id, genre_ids: [])
  end

  def check_role
    if user_signed_in? && !@rolls.include?("artist")
      flash[:alert] = "You need to have an artist profile in order to do that"
      redirect_to songs_path
    end
  end

  def check_artist
    if user_signed_in? && !(@usr.id == Song.find(params[:id].to_i).artist.user_id)
      flash[:alert] = "Only the artist can edit their own song"
      redirect_to songs_path
    end
  end

  def check_block
    if user_signed_in? && @rolls.include?("blocked")
      flash[:alert] = "Your account has been blocked. Please contact an administrator"
      redirect_to root_path
    end
  end
end
