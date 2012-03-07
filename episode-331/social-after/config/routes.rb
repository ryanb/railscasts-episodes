Social::Application.routes.draw do
  root to: 'users#index'
  resources :users
  mount Split::Dashboard, at: 'split'
end
