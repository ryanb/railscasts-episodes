Blog::Application.routes.draw do
  root to: 'articles#index'
  resources :authors
  resources :articles
  resources :comments
end
