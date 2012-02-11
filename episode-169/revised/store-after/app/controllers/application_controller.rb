class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def admin?
    current_user && current_user.admin?
  end
  helper_method :admin?
end
