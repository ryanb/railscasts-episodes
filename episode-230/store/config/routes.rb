Store::Application.routes.draw do
  resources :products do
    resources :reviews
  end
  root :to => "products#index"
end
