ActionController::Routing::Routes.draw do |map|
  map.resources :tasks
  map.resources :projects
  map.root :projects
end
