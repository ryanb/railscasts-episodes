ActionController::Routing::Routes.draw do |map|
  map.register 'register', :controller => 'users', :action => 'new'
  map.register 'login', :controller => 'sessions', :action => 'new'
  map.register 'logout', :controller => 'sessions', :action => 'destroy'
  map.resources :users
  map.resource :session
  map.resources :products
  map.root :controller => 'products'
end
