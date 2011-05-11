module EngineRegister
  module EngineExtension
    module ClassMethods
      attr_accessor :ext_name
      attr_accessor :show_in_menu
      attr_accessor :assets_path
      
      def present_engines
        subclasses.reject{|i| i.ext_name.nil?}
      end
      
      def register(extname=nil, showinmenu = true)
        @ext_name = extname || self.name
        @show_in_menu = showinmenu
        @assets_path = File.expand_path("../../../../app/assets", __FILE__)
        Compass.configuration.add_import_path(File.join(@assets_path, "stylesheets"))
      end
      
      def compass_root_paths
        Rails.cache.fetch('compass_assets_path_extended'){subclasses.collect{|i| i.assets_path}.compact}
      end
    end
    
    module InstanceMethods
    end
    
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end

Rails::Engine.send(:include, EngineRegister::EngineExtension)