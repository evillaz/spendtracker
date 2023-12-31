class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email)
    end
  end

  def after_sign_in_path_for(_resource)
    categories_path
  end
end
