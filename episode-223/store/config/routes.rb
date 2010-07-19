Store::Application.routes.draw do |map|
  resources :orders
  root :to => "orders#index"
end
