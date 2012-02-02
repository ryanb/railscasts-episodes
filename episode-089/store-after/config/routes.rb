Store::Application.routes.draw do
  get 'products/page/:page', to: 'products#index'
  resources :products
  root to: 'products#index'
end
