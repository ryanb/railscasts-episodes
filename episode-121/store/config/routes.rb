ActionController::Routing::Routes.draw do |map|
  map.resources :letters
  map.resources :products
  map.resources :categories
  map.root :products
end
