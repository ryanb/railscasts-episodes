Blog::Application.routes.draw do |map|
  resources :articles
  root :to => "articles#index"
end
