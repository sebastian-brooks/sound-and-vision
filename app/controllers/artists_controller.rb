class ArtistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_role, only: [:edit]
  before_action :check_block
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.paginate(page: params[:page], per_page: 9).includes(:songs).with_attached_image.order(:name)
  end

  def show
    @songs = @artist.songs.paginate(page: params[:page], per_page: 9).includes(:genres)
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.create(artist_params)

    if artist.id.nil?
      flash[:alert] = artist.errors.full_messages.join(" | ").upcase
      redirect_to new_artist_path
    else
      if !artist.image.attached?
        artist.image.attach(
          io: File.open("app/assets/images/artist.png"),
          filename: "artist.png",
          content_type: "image/png",
          identify: false
        )
      end
      current_user.add_role(:artist)
      redirect_to artist_path(artist)
    end
  end

  def edit
  end

  def update
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def set_artist
    @artist = Artist.includes(image_attachment: :blob).find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :email, :description, :website, :image, :user_id)
  end

  def check_role
    if user_signed_in? && !(@rolls.include?("admin") || @usr.artists.ids.include?(params[:id].to_i))
      flash[:alert] = "Only the artist can edit their profile"
      redirect_to artists_path
    end
  end

  def check_block
    if user_signed_in? && @rolls.include?("blocked")
      flash[:alert] = "Your account has been blocked. Please contact an administrator"
      redirect_to root_path
    end
  end
end
