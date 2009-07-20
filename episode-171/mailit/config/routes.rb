ActionController::Routing::Routes.draw do |map|
  map.resources :mailings, :member => { :deliver => :post }
  map.root :mailings
end
