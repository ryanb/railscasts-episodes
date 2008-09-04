ActionController::Routing::Routes.draw do |map|
  map.resources :people

  map.resources :products
  map.resources :categories
  map.root :products
end
