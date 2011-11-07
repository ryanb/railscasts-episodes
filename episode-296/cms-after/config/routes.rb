Cms::Application.routes.draw do
  Mercury::Engine.routes

  root to: 'pages#index'
  resources :pages do
    member { post :mercury_update }
  end
end
