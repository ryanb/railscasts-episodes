class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user
    warden.user
  end
  helper_method :current_user
  
  def warden
    env['warden']
  end
end
