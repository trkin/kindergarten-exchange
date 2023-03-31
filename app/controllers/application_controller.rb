class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:phone, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:phone, :password, :password_confirmation)
    end
  end

  def authenticate_admin!
    unless current_user
      redirect_to root_path and return
    end
    redirect_to new_user_session_path unless current_user.is_admin?
  end
end