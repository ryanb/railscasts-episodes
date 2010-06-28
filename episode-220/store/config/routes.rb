Store::Application.routes.draw do |map|
  resources :orders
  resources :line_items
  resources :carts
  resources :products
  resources :categories
  root :to => "products#index"
end
