ActionController::Routing::Routes.draw do |map|
  map.resources :animals
  map.resources :categories
  map.root :animals
end
