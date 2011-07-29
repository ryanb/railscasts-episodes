Rails.application.routes.draw do

  get "simulate/failure"

  mount Uhoh::Engine => "/uhoh", :as => "uhoh_engine"
end
