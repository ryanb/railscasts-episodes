ActionController::Routing::Routes.draw do |map|
  map.resources :orders

  map.current_cart 'cart', :controller => 'carts', :action => 'show', :id => 'current'
  
  map.resources :line_items
  map.resources :carts
  map.resources :products
  map.resources :categories
  map.root :products
end
