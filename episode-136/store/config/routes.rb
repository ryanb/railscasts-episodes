ActionController::Routing::Routes.draw do |map|
  map.resources :reviews

  map.resources :products
  map.resources :categories
  map.root :products
end
