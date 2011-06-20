Coderbits::Application.routes.draw do
  resources :snippets
  root :to => "snippets#new"
  mount Resque::Server, :at => "/resque"
end
