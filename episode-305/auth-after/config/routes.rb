Auth::Application.routes.draw do
  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    get "signup", to: "users#new", as: "signup"
    get "login", to: "sessions#new", as: "login"
  end
  get "logout", to: "sessions#destroy", as: "logout"
  root to: "home#index"
  resources :users
  resources :sessions
end
