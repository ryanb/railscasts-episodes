Blog::Application.routes.draw do
  root :to => "articles#index"
  
  resources :articles do
    resources :comments
  end
end
