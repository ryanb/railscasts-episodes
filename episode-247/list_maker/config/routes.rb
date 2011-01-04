ListMaker::Application.routes.draw do
  match "/application.manifest" => Rails::Offline
  resources :items
end
