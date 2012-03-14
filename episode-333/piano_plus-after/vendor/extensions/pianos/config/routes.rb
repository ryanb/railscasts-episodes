Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :pianos do
    resources :pianos, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pianos, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :pianos, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
