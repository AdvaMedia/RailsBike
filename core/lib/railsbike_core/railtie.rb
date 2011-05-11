module RailsbikeCore
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)
    
    def self.activate
      
      
      RailsbikeCore::ThemeSupport::HookListener.subclasses.each do |hook_class|
        RailsbikeCore::ThemeSupport::Hook.add_listener(hook_class)
      end
      
    end
    config.to_prepare &method(:activate).to_proc
    
    config.after_initialize do
      register("railsbike_core", true)
    end
  end
end