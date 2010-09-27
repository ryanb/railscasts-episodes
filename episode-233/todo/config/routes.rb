Todo::Application.routes.draw do
  devise_for :users
  resources :projects, :tasks
  root :to => "projects#index"
end
