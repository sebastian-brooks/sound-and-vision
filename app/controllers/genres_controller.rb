class GenresController < ApplicationController
  def create
    genre = Genre.create(genre_params)
    if genre.id.nil?
      flash[:alert] = genre.errors.full_messages.join(" | ").upcase
      redirect_to admin_path
    else
      redirect_to admin_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
