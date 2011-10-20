Notify::Application.routes.draw do
  root to: 'boom#index'
  match 'boom', to: 'boom#boom', as: 'boom'
end
