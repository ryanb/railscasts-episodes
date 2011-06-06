Store::Application.routes.draw do
  resources :products
  root :to => 'home#index'

  namespace :admin do
    resources :categories
    resources :products
  end
end
