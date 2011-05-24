require 'devise'
require 'cancan'

require 'railsbike_core'
require 'railsbike_auth_hooks'
module RailsbikeAuth
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)
    
    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end
    
    config.to_prepare &method(:activate).to_proc
    
    config.after_initialize do
      register("railsbike_auth", true)
    end
  end
end
