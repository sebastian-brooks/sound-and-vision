class PagesController < ApplicationController
  before_action :check_roles, only: [:admin]

  def index
  end

  def admin
  end

  private

  def check_roles
    if !current_user.has_role?(:admin)
      flash[:alert] = "You do not have access to that part of the site"
      redirect_to root_path
    end
  end
end
