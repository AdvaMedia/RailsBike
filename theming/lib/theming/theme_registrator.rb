require 'yaml'
module RailsbikeTheming
  module ThemeRegistrator
    def self.register_static_themes
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/views/layouts/themes/*')) do |c|
        configfilepath = File.join(c, 'theme.yml')
        themename = File.basename(c)
        ThemesListener.add(themename, File.exist?(configfilepath) ? YAML::load(File.open(configfilepath)) : {}) unless ThemesListener.instance.themes.any?{|t| t.name == themename}
      end
    end
    
    def self.themes
      ThemesListener.instance.themes || []
    end
  end
end