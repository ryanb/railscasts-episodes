ActionController::Routing::Routes.draw do |map|
  map.resources :cart_items
  map.resources :carts
  map.resources :products
  map.resources :categories
  map.root :products
  
  map.current_cart 'cart', :controller => 'carts', :action => 'show'
end
