ActionController::Routing::Routes.draw do |map|
  map.resources :groups
  map.resources :comments
  map.resources :users
  map.root :comments
end
