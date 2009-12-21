ActionController::Routing::Routes.draw do |map|
  map.resources :recommendations

  map.resources :articles, :comments
  map.root :articles
end
