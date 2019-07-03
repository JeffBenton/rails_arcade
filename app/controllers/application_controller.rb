class ApplicationController < ActionController::Base
  helper_method :current_user, :is_logged_in?

  def current_user
    if is_logged_in?
      User.find_by_id(session[:user_id])
    end
  end

  def is_logged_in?
    session[:user_id].present?
  end

  def require_logged_in
    redirect_to root_url unless is_logged_in?
  end

  def require_admin
    redirect_to games_path unless current_user.admin
  end

end
