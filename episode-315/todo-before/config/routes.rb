Todo::Application.routes.draw do
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  root to: "tasks#index"
  resources :tasks
  resources :sessions
  resources :phone_requests
end
