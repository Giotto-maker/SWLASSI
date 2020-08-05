class ApplicationController < ActionController::Base
    include SessionsHelper

    before_action :configure_permitted_parameters, if: :devise_controller?

    def handle_unverified_request
        
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :username, :category, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :username, :category, :email, :password, :password_confirmation, :current_password)}
    end

    private

    def after_sign_out_path_for(resource_or_scope)
        '/homepage'
    end
end
