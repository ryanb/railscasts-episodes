Store::Application.routes.draw do
  root to: 'products#index'

  match 'signup', to: 'users#new', as: 'signup'
  match 'logout', to: 'sessions#destroy', as: 'logout'
  match 'login', to: 'sessions#new', as: 'login'

  resources :products
  resources :sessions
  resources :users
end
