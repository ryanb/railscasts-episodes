Store::Application.routes.draw do |map|
  root :to => HomeApp
  
  match "/about" => redirect("/aboutus")
  match "/aboutus" => "info#about"
  
  resources :products
  match "/p/:id" => redirect("/products/%{id}")
  
  match "/processes" => ProcessesApp.action(:index)
end
