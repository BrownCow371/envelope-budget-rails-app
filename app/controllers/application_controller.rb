class ApplicationController < ActionController::Base

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||=User.find_by_id(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  helper_method :logged_in?
end
