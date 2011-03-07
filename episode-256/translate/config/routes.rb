Translate::Application.routes.draw do
  resources :translations
  root :to =>  "home#index"
end
