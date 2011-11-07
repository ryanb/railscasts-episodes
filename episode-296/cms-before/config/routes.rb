Cms::Application.routes.draw do
  root to: 'pages#index'
  resources :pages
end
