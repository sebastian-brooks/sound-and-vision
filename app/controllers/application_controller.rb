class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :get_user_info

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end

    private

    def get_user_info
        if user_signed_in?
            @usr = current_user
            @rolls = @usr.roles.pluck(:name.to_s)
        end
    end
end
