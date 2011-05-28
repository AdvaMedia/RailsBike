module RailsbikeCore
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)
    
    #config.active_record.observers = :page_observer
    
    def self.activate
      
      
      RailsbikeCore::ThemeSupport::HookListener.subclasses.each do |hook_class|
        RailsbikeCore::ThemeSupport::Hook.add_listener(hook_class)
      end
      
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end
    config.to_prepare &method(:activate).to_proc
    
    config.after_initialize do
      register("railsbike_core", true)
    end
  end
end