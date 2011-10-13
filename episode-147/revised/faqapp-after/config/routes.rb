Faqapp::Application.routes.draw do
  root to: 'faqs#index'
  resources :faqs do
    collection { post :sort }
  end
end
