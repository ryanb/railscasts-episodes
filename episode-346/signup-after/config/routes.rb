Signup::Application.routes.draw do
  resources :users
  resources :user_steps
  root to: 'users#index'
end
