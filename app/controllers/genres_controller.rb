class GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :genre_songs]
  before_action :check_roles, only: [:new, :edit]
  before_action :check_block
  before_action :set_genre, except: [:index, :new, :create, :genre_songs]

  def index
    @genres = Genre.all.order(:name)
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def create
    genre = Genre.create(genre_params)
    if genre.id.nil?
      flash[:alert] = genre.errors.full_messages.join(" | ").upcase
      redirect_to new_genre_path(genre)
    else
      redirect_to genres_path
      flash[:alert] = "#{genre.name} added to genres"
    end
  end

  def edit
  end

  def update
    @genre.update(genre_params)
    redirect_to genres_path
  end

  def destroy
    @genre.destroy
    redirect_to genres_path
  end

  def genre_songs
    @genre_name = Genre.find(params[:genre]).name
    @songs = Genre.find(params[:genre]).songs
  end

  private
  
  def check_roles
    if user_signed_in? && !current_user.has_role?(:admin)
      flash[:alert] = "You do not have access to that part of the site"
      redirect_to genres_path
    end
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

  def check_block
    if user_signed_in? && current_user.has_role?(:blocked)
      flash[:alert] = "Your account has been blocked. Please contact an administrator"
      redirect_to root_path
    end
  end
end
