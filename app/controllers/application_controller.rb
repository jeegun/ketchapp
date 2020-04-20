class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :home_city, :latitude, :longitude])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :home_city, :phone_number, :latitude, :longitude])
  end
end
