ActionController::Routing::Routes.draw do |map|
  map.resources :articles, :comments
  map.root :articles
end
