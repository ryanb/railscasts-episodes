OauthClient::Application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signout', to: 'sessions#destroy', as: 'signout'

  resources :tasks
  root to: 'tasks#index'
end
