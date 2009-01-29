ActionController::Routing::Routes.draw do |map|
  map.resources :faqs, :collection => { :sort => :post }
  map.root :faqs
end
