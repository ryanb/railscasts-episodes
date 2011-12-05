Auth::Application.routes.draw do
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  root to: "home#index"
  resources :users
  resources :sessions
end
