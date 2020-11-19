class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :search_results]
  before_action :check_purchase, only: [:purchases]
  before_action :check_roles, only: [:admin]
  before_action :check_block, except: [:index]

  def index
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
      @genres = Genre.includes(:songs).order(:name).where("lower(name) LIKE :search", search: "%#{@parameter}%")
      @result_count = @genres.size
    when 1
      @search_type = "song"
      @songs = Song.includes(:genres, artist: :image_blob).order(:name).where("lower(name) LIKE :search", search: "%#{@parameter}%")
      @result_count = @songs.size
    when 2
      @search_type = "artist"
      @artists = Artist.includes(:songs).with_attached_image.order(:name).where("lower(name) LIKE :search", search: "%#{@parameter}%")
      @result_count = @artists.size
    end
  end

  def account
    @user = @usr
    @artists = @user.artists.paginate(page: params[:page], per_page: 9).includes(:songs).with_attached_image.order(:name) if @rolls.include?("artist")
  end

  def purchases
    @user_songs = current_user.songs.paginate(page: params[:page], per_page: 9).includes(:genres, artist: :image_blob).order(:name)
  end

  def admin
    @users = User.paginate(page: params[:page], per_page: 9).includes(:roles).where("id <> #{current_user.id}").order(:first_name)
  end
  
  def change_role
    @user = User.find(params[:id])

    case params[:role].to_i
    when 0
      @rolls.include?("admin") ? @user.remove_role(:admin) : @user.add_role(:admin)
    when 1
      @rolls.include?("artist") ? @user.remove_role(:artist) : @user.add_role(:artist)
    when 2
      @rolls.include?("blocked") ? @user.remove_role(:blocked) : @user.add_role(:blocked)
    end
    
    redirect_to admin_path
  end

  private

  def check_roles
    if user_signed_in? && !@rolls.include?("admin")
      flash[:alert] = "You do not have access to that part of the site"
      redirect_to root_path
    end
  end

  def check_purchase
    if current_user.songs.size == 0
      flash[:alert] = "You do not have any purchases"
      redirect_to account_path
    end
  end

  def check_block
    if user_signed_in? && @rolls.include?("blocked")
      flash[:alert] = "Your account has been blocked. Please contact an administrator"
      redirect_to root_path
    end
  end
end
