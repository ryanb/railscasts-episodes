ActionController::Routing::Routes.draw do |map|
  map.resources :articles, :has_many => :comments, :shallow => true
  map.resources :comments, :only => [:index]
  map.root :articles
end
