Store::Application.routes.draw do |map|
  resources :categories
  resources :products
  root :to => "products#index"
end
