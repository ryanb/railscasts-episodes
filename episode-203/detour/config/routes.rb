Detour::Application.routes.draw do |map|
  # map.resources :products, :member => { :detailed => :get }
  resources :products do
    get :detailed, :on => :member
  end
  
  # map.resources :forums, :collection => { :sortable => :get, :sort => :put } do |forums|
  #   forums.resources :topics
  # end
  resources :forums do
    collection do
      get :sortable
      put :sort
    end
    resources :topics
  end
  
  # map.root :controller => "home", :action => "index"
  root :to => "home#index"
  
  # map.about "/about", :controller => "info", :action => "about" 
  match "/about(.:format)" => "info#about", :as => :about
  
  match "/:year(/:month(/:day))" => "info#about", :constraints => { :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ }
  
  constraints :host => /localhost/ do
    match "/secret" => "info#about"
  end
  
  match "/hello" => proc { |env| [200, {}, "Hello Rack!"] }
end
