class ArtistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_roles, only: [:new, :edit]
  before_action :check_block
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :set_user_artist, only: [:index]

  def index
    @artists = Artist.paginate(page: params[:page], per_page: 3)
  end

  def show
    @songs = @artist.songs
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
    @artist = Artist.find(params[:id])
  end

  def set_user_artist
    if user_signed_in? && current_user.has_role?(:artist)
      @user_artist = Artist.where(user_id: current_user)
    end
  end

  def artist_params
    params.require(:artist).permit(:name, :email, :description, :website, :image, :user_id)
  end

  def check_roles
    if user_signed_in? && !current_user.has_role?(:artist)
      flash[:alert] = "You do not have access to that part of the site"
      redirect_to artists_path
    end
  end

  def check_block
    if user_signed_in? && current_user.has_role?(:blocked)
      flash[:alert] = "Your account has been blocked. Please contact an administrator"
      redirect_to root_path
    end
  end
end
