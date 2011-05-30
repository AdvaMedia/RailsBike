require 'yaml'
module RailsbikeTheming
  module TemplateRegistrator
    def self.register_static_templates
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/views/layouts/templates/*')) do |c|
        configfilepath = File.join(c, 'template.yml')
        dirname_of_template = File.dirname(configfilepath)
        template_name = File.basename(c)        
        template = Template.find_or_create_by(:name=>template_name, :path=>dirname_of_template)
        add_css_files_to_base(template)
      end
    end
    
    # Add content of css file to the base (editable=>false)
    def self.add_css_files_to_base(template=nil)
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/assets/stylesheets/templates/', template.name, '*')) do |css_file_path|
        css_file = CssFile.find_or_create_by(:name=>File.basename(css_file_path), :template_id=>template.id, :editable=>false, :full_path=>css_file_path)
        css_file.content = File.read(css_file_path)
        css_file.save
      end
    end
  end
end