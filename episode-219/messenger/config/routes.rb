Messenger::Application.routes.draw do |map|
  resources :messages
  root :to => "messages#new"
end
