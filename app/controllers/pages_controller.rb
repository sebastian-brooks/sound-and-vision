class PagesController < ApplicationController
  before_action :check_roles, only: [:admin]
  before_action :check_block, except: [:index]
  before_action :authenticate_user!, except: [:index, :search, :search_results, :genre_songs]

  def index
  end

  def admin
    @users = User.all.where("id <> #{current_user.id}").first(25)
  end

  def search
  end

  def search_results
    if params[:search].blank?
      redirect_to(search_path, alert: "EMPTY SEARCH FIELD")
    end

    @parameter = params[:search].downcase

    @type = params[:type].to_i
    case @type
    when 0
      @search_type = "genre"
      @genres = Genre.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    when 1
      @search_type = "song"
      @songs = Song.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    when 2
      @search_type = "artist"
      @artists = Artist.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def genre_songs
    @genre = Genre.find(params[:genre]).name
    @songs = Genre.find(params[:genre]).songs
  end

  def purchases
    @user_songs = current_user.songs if current_user.songs.size > 0
  end

  def account
    @user = current_user
    @artists = @user.artists if @user.has_role?(:artist)
  end
  
  def change_role
    @user = User.find(params[:id])

    case params[:role].to_i
    when 0
      @user.has_role?(:admin) ? @user.remove_role(:admin) : @user.add_role(:admin)
    when 1
      @user.has_role?(:blocked) ? @user.remove_role(:blocked) : @user.add_role(:blocked)
    end
    
    redirect_to admin_path
  end

  private

  def check_roles
    if user_signed_in? && !current_user.has_role?(:admin)
      flash[:alert] = "You do not have access to that part of the site"
      redirect_to root_path
    end
  end

  def check_block
    if user_signed_in? && current_user.has_role?(:blocked)
      flash[:alert] = "Your account has been blocked. Please contact an administrator"
      redirect_to root_path
    end
  end
end
