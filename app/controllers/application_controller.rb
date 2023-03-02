class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? #can call method in view when use helper_method

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if !logged_in?
      flash[:error] = "you must login"
      redirect_to login_path
    end
  end
end
