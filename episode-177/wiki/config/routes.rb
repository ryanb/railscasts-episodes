ActionController::Routing::Routes.draw do |map|
  map.resources :pages
  map.named_page ":name", :controller => :pages, :action => :named
  map.root :controller => :pages, :action => :named, :name => "HomePage"
end
