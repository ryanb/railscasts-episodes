Picturesque::Application.routes.draw do
  root :to => "galleries#index"

  resources :galleries
  resources :paintings
end
