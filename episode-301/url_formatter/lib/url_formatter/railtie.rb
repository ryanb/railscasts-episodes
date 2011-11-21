module UrlFormatter
  class Railtie < Rails::Railtie
    initializer 'url_formatter.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end
    end
  end
end