ActionController::Routing::Routes.draw do |map|
  map.resources :pages
  map.resources :products
  map.resources :categories
  map.root :products
  
  map.static 'static/:permalink', :controller => 'pages', :action => 'show'
  
  # or 
  
  map.with_options :controller => 'info' do |info|
    info.about 'about', :action => 'about'
    info.contact 'contact', :action => 'contact'
    info.privacy 'privacy', :action => 'privacy'
  end
end
