module RailsbikeTheming
  class Theme
    attr_accessor :name, :options
    
    def initialize(theme_name, theme_options={})
      @name, @options = theme_name, theme_options
    end
  end
end