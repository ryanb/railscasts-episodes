Highlighter::Application.routes.draw do
  resources :articles
  resources :snippets
  root to: 'snippets#new'
end
