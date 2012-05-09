require "action_controller/railtie"
require "coderay"

class TheSmallestRailsApp < Rails::Application
  config.secret_token = "1780a66b68f2728158a3820af99b696f29285e82d23e9"
  initialize!
  routes.draw do
    root to: 'hello#world'
  end
end

run TheSmallestRailsApp
