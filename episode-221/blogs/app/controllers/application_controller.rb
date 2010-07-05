class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  layout 'application'
end
