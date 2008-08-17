begin
  require File.dirname(__FILE__) + '/../../../../spec/spec_helper'
rescue LoadError
  puts "You need to install rspec in your base app"
  exit
end

plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

ActionController::Routing::Routes.draw do |map|
  map.needs_subdomain '/needs_subdomain', :controller => "fu", :action => "awesome"
  map.no_subdomain '/no_subdomain', :controller => "fu", :action => "lame"
  map.needs_awesome '/needs_awesome', :controller => "fu", :action => "lame"
  
  map.resources :foos do |fu|
    fu.resources :bars
  end
  
  map.connect '/', :controller => "site", :action => "home", :conditions => {:subdomain => false}
  map.connect '/', :controller => "app", :action => "home", :conditions => {:subdomain => true}
  map.connect '/', :controller => "mobile", :action => "home", :conditions => {:subdomain => "m"}
  
  map.connect '/subdomain_here', :controller => "app", :action => "success", :conditions => {:subdomain => true}
  map.connect '/no_subdomain_here', :controller => "site", :action => "success", :conditions => {:subdomain => false}
  map.connect '/m_subdomain_here', :controller => "mobile", :action => "success", :conditions => {:subdomain => "m"}
  map.connect '/numbers_only_here', :controller => "numbers", :action => "success", :conditions => {:subdomain => /[0-9]+/}
  
  map.connect '/:controller/:action/:id'
end

class Paramed
  def initialize(param)
    @param = param
  end
  
  def to_param
    @param || "param"
  end
end

include ActionController::UrlWriter