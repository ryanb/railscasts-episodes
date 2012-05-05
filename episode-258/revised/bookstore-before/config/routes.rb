Bookstore::Application.routes.draw do
  resources :authors
  resources :books
  root to: 'books#index'
end
