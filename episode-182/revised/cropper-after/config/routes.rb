Cropper::Application.routes.draw do
  root to: 'users#index'
  resources :users
end
