module RailsbikeTheming
  class Template
    attr_accessor :name, :options, :path
    
    def initialize(theme_name, theme_options={}, path = nil)
      @name, @options = theme_name, theme_options
    end
    
    #return all registreted themes
    def themes
      Theme.where(:template_name=>self.name).all
    end
    
    
    def init_themes!
      @options["themes"].each do |theme|
        Theme.find_or_create_by(:name=>theme, :template_name=>self.name)
      end
      return themes.count
    end
  end
end