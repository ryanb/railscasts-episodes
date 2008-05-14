# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.action_controller.session = {
    :session_key => '_store_session',
    :secret      => '7ce7aaf7795f2858376fec2986ee0831c28a2d2a994c457143bd72fc9e2674812e3c0f8c86e8f8965e9e6b504ef43059ab7dee0f8cd7ceedca7f240f8cc8746e'
  }
  config.time_zone = "Pacific Time (US & Canada)"
end
