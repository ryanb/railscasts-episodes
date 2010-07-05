Blogs::Application.routes.draw do |map|
  resources :comments
  resources :articles
  resources :blogs
  constraints(Subdomain) do
    match '/' => 'blogs#show'
  end
  root :to => 'blogs#index'
end
