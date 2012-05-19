Blog::Application.routes.draw do
  resources :articles do
    resources :comments
  end
  
  resources :photos do
    resources :comments
  end
  
  resources :events do
    resources :comments
  end
  
  root to: 'articles#index'
end
