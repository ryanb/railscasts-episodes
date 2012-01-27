Processes::Application.routes.draw do
  root to: 'processes#index'
  match 'processes/old_list', to: 'processes#list'
end
