Auth::Application.routes.draw do
  get "secret" => "home#secret", :as => "secret"
  root :to => "home#index"
end
