require 'yaml'
module RailsbikeTheming
  module TemplateRegistrator
    def self.register_static_templates
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/views/layouts/templates/*')) do |c|
        configfilepath = File.join(c, 'template.yml')
        template_name = File.basename(c)
        additional_options_hash = []
        if File.exist?(configfilepath)
          additional_options_hash = [template_name, YAML::load(File.open(configfilepath)), File.dirname(configfilepath)]
        else
          additional_options_hash = [template_name, {}, nil]
        end
        TemplatesListener.add(*additional_options_hash) unless TemplatesListener.instance.templates.any?{|t| t.name == template_name}
      end
    end
    
    def self.templates
      TemplatesListener.instance.templates || []
    end
  end
end