class ApplicationController < ActionController::Base
    
  def authenticate_admin!
    unless current_user
      redirect_to root_path and return
    end
    redirect_to new_user_session_path unless current_user.is_admin?
  end
end
