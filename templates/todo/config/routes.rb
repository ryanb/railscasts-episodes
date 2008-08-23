ActionController::Routing::Routes.draw do |map|
  map.resources :projects, :tasks
  map.root :projects
end
