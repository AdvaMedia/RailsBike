require 'yaml'
require 'erb'

module Railsbike
  class ConfigUndefined < StandardError; end #Config
  class Config
    class << self
      def setup!
        find_ymls.each do |yml|
          create_railsconfig_class(yml)
        end
      end
      
      def find_ymls
        main_file = "#{Rails.root.to_s}/config/railsbike.yml"
        railsconfig_main_file = File.exists?(main_file) ? [main_file] : []
        railsconfig_namespaced_files = Dir.glob("#{Rails.root.to_s}/config/railsbike/**/*.yml")
        railsconfig_main_file.concat(railsconfig_namespaced_files)
      end
      
      def create_railsconfig_class(yml_file)
        hash = load_yml(yml_file)
        klass_name = File.basename(yml_file).gsub(".yml","").camelize
        klass_name = "#{klass_name}Config" unless klass_name=="Config"
        klass = Object.const_set(klass_name,Class.new) unless Object.constants.include?(klass_name.to_sym)
        hash.each do |key,value|
          klass.define_singleton_method(key){ value }
        end
        klass.class_eval do
          def self.method_missing(method_id,*args)
            raise ConfigUndefined, "#{method_id} is not defined in #{self.to_s}"
          end
        end
      end

      def load_yml(yml_file)
        erb = ERB.new(File.read(yml_file)).result
        YAML.load(erb).to_hash[Rails.env]
      end
    end
  end #Config
end #Railsbike