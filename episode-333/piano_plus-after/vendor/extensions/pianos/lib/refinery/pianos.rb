require 'refinerycms-core'

module Refinery
  autoload :PianosGenerator, 'generators/refinery/pianos_generator'

  module Pianos
    require 'refinery/pianos/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
