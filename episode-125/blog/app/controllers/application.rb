# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9346baedc099926e71cc3a3f39613aa6'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  private
  
  def load_blog
    @current_blog = Blog.find_by_subdomain(current_subdomain)
    if @current_blog.nil?
      flash[:error] = "Blog invalid"
      redirect_to root_url
    else
      self.class.layout(@current_blog.layout_name || 'application')
    end
  end
end
