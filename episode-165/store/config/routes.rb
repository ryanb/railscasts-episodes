ActionController::Routing::Routes.draw do |map|
  map.resources :products, :collection => { :edit_multiple => :post, :update_multiple => :put }
  map.resources :categories
  map.root :products
end
