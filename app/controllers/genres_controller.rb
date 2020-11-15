class GenresController < ApplicationController
  before_action :check_roles
  before_action :authenticate_user!
  before_action :set_genre, except: [:index, :new, :create]

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

  private
  
  def check_roles
    if user_signed_in? && !current_user.has_role?(:admin)
      flash[:alert] = "You do not have access to that part of the site"
      redirect_to root_path
    end
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
