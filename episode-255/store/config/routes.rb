Store::Application.routes.draw do
  post "versions/:id/revert" => "versions#revert", :as => "revert_version"
  resources :products
  root :to => "products#index"
end
