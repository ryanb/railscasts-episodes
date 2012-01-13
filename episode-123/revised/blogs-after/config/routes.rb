Blogs::Application.routes.draw do
  resources :blogs
  resources :articles
  match '', to: 'blogs#show', constraints: {subdomain: /.+/}
  # or to skip www:
  # match '', to: 'blogs#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  root to: 'blogs#index'
end
