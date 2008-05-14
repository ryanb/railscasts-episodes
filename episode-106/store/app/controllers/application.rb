# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  include AuthenticatedSystem
  
  before_filter :set_user_time_zone
  
  private
  
  def set_user_time_zone
    Time.zone = current_user.time_zone if logged_in?
  end
end
