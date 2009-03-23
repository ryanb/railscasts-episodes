ActionController::Routing::Routes.draw do |map|
  map.resources :photos, :has_many => :comments
  map.resources :events, :has_many => :comments
  map.resources :articles, :has_many => :comments
  
  map.root :articles
end
