ActionController::Routing::Routes.draw do |map|
  map.resources :products, :collection => { :edit_individual => :post, :update_individual => :put }
  map.resources :categories
  map.root :products
end
