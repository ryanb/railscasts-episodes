ActionController::Routing::Routes.draw do |map|
  map.resources :processes, :collection => { :list => :get }
  map.root :processes
end
