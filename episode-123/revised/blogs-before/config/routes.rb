Blogs::Application.routes.draw do
  resources :blogs
  resources :articles
  root to: 'blogs#index'
end
