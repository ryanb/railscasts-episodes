Blog::Application.routes.draw do
  resources :comments

  resources :articles
  root :to => "articles#index"
end
