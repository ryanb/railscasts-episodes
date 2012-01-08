Mailit::Application.routes.draw do
  root to: 'newsletters#index'
  resources :newsletters do
    member { post :deliver }
  end
end
