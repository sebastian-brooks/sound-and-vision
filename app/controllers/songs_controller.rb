class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_user_artists, only: [:new, :edit]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    song = Song.create(song_params)
    redirect_to song_path(song)
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

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def set_song_artist
    song = set_song
    @artist = song.artist_id
  end

  def set_user_artists
    @artists = Artist.where(user_id: current_user.id)
  end

  def song_params
    params.require(:song).permit(:name, :description, :price, :exclusive_price, :artist_id)
  end
end
