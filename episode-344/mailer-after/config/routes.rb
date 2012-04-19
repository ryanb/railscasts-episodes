Mailer::Application.routes.draw do
  resources :newsletters do
    member { post :deliver }
  end
  root to: 'newsletters#index'
end
