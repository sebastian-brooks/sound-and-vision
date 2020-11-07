class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :set_user_artist, only: [:index]

  def index
    @artists = Artist.all
  end

  def show
    genres = []
    if !@artist.songs.nil?
      @artist.songs.each do |song|
        genres << song.genres.pluck(:name)
      end
    end
    @genres = genres.flatten.uniq.join(", ")
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.create(artist_params)
    current_user.add_role(:artist)
    redirect_to artist_path(artist)
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
    if current_user.has_role?(:artist)
      @user_artist = Artist.where(user_id: current_user)
    end
  end

  def artist_params
    params.require(:artist).permit(:name, :email, :description, :website, :image, :user_id)
  end
end
