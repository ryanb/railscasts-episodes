Todo::Application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :tasks
    end
  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  resources :tasks
  root to: 'tasks#index'
end
