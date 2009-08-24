ActionController::Routing::Routes.draw do |map|
  map.resources :searches

  map.resources :products
  map.resources :categories
  map.root :products
end
