class PagesController < ApplicationController
  before_action :check_roles, only: [:admin]
  before_action :authenticate_user!, except: [:index, :search]

  def index
  end

  def admin
    @users = User.all.where("id <> #{current_user.id}").first(25)
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      # @parameter = params[:search].downcase
      # @results = Artist.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
      @search = params[:search]
      @results = Song.joins(:artist).search(params[:search]).order(:name).first(25)
    end
  end

  def purchases
    @user_songs = current_user.songs if current_user.songs.size > 0
  end

  private

  def check_roles
    if !current_user.has_role?(:admin)
      flash[:alert] = "You do not have access to that part of the site"
      redirect_to root_path
    end
  end
end
