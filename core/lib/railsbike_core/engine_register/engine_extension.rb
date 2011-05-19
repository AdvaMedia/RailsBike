require 'compass' 
require 'compass/app_integration/rails'
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
        #@assets_path = File.expand_path("../../../../app/assets", __FILE__)
        @assets_path = File.join(self.root, "app", "assets")
        
        Sass::Engine::DEFAULT_OPTIONS[:load_paths].tap do |load_paths|
          load_paths << "#{self.root}/app/assets/stylesheets"
          [:compass, :blueprint].each do |additional|
            additional_path = "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/#{additional.to_s}/stylesheets"
            load_paths << additional_path unless load_paths.include? additional_path
          end
        end
        
        #configuration = StringIO.new(<<-CONFIG) 
        #  project_type = :rails 
        #  project_path = "#{self.root}"
        #  http_path = "/" 
        #  css_dir =  "app/assets/stylesheets/compiled"
        #  sass_dir = "app/assets/stylesheets" 
        #  environment = Compass::AppIntegration::Rails.env 
        #  preferred_syntax = :sass 
        #CONFIG
        
        Compass.configuration.add_import_path(File.join(@assets_path, "stylesheets"))
        #Compass.add_configuration(configuration, self.name) 
        #Compass.discover_extensions! 
        #Compass.configure_sass_plugin! 
        #Compass.handle_configuration_change!
        #Sass::Plugin.add_template_location(File.join("#{self.root}", 'app', 'assets', 'stylesheets'), File.join("#{self.root}", 'app', 'assets', 'stylesheets', 'compiled') )
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