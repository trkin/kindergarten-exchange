class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :resource

  def content_not_found
    render file: "#{Rails.root}/public/404.html", layout: true, status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation)
    end
  end

  def authenticate_admin!
    unless current_user
      redirect_to root_path and return
    end
    redirect_to new_user_session_path unless current_user.is_admin?
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end
end
