Store::Application.routes.draw do
  resources :products
  root :to => 'home#index'
end
