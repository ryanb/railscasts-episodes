Processes::Application.routes.draw do
  root to: 'processes#index'
  match 'processes/list', to: 'processes#list'
end
