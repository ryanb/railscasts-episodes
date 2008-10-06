module Workling
  module Starling
    def self.config
      config_path = File.join(RAILS_ROOT, 'config', 'starling.yml')
      @@config ||=  YAML.load_file(config_path)[RAILS_ENV || 'development'].symbolize_keys
      @@config[:memcache_options].symbolize_keys! if @@config[:memcache_options]
      @@config 
    end    
  end
end