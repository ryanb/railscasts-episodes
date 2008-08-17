ActionController::Routing::Routes.draw do |map|
  map.resources :blogs, :articles, :comments
  map.blog_root '', :controller => 'blogs', :action => 'show', :conditions => { :subdomain => /.+/ }
  map.root :blogs
end
