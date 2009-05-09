require "rack/bug"

ActionController::Dispatcher.middleware.use Rack::Bug,
  :ip_masks   => [IPAddr.new("127.0.0.1")],
  :secret_key => "epT5uCIchlsHCeR9dloOeAPG66PtHd9K8l0q9avitiaA/KUrY7DE52hD4yWY+8z1",
  :password   => "secret"
