Store::Application.routes.draw do |map|
  resources :products
  root :to => "products#index"
end
