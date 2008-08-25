ActionController::Routing::Routes.draw do |map|
  map.resources :invitations

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup/:invitation_token', :controller => 'users', :action => 'new'
  
  map.resource :session
  map.resources :users, :projects, :tasks
  
  map.root :controller => 'home'
end
