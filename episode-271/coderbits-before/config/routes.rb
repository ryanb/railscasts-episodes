Coderbits::Application.routes.draw do
  resources :snippets
  root :to => "snippets#new"
end
