module Refinery
  module Pianos
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Pianos

      engine_name :refinery_pianos

      initializer "register refinerycms_pianos plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pianos"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pianos_admin_pianos_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/pianos/piano',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Pianos)
      end
    end
  end
end
