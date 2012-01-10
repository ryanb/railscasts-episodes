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
    Rollout.where(name: name).any? do |rollout|
      rollout.match?(current_user)
    end
  end
  helper_method :rollout?

  def degrade_feature(name)
    yield
  rescue StandardError => e
    Rollout.where(name: name).each do |rollout|
      rollout.increment!(:failure_count)
    end
    raise e
  end
end
