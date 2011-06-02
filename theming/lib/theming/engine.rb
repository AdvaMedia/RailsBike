require 'railsbike_core'
require 'railsbike_theming_hooks'
module RailsbikeTheming
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)
    
    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end
    
    config.to_prepare &method(:activate).to_proc
    
    config.after_initialize do
      register("railsbike_theming", true)
    end
  end
end
