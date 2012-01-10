class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def authenticate
    redirect_to login_url if current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def rollout?(name)
    $rollout.active? name, current_user
  end
  helper_method :rollout?
end
