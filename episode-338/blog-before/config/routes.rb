Blog::Application.routes.draw do
  scope ':locale', locale: /#{I18n.available_locales.join("|")}/ do
    resources :articles
    root to: 'articles#index'
  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  match '', to: redirect("/#{I18n.default_locale}")
end
