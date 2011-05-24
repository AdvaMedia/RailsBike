module RailsbikeTheming
  class ThemesListener
    include Singleton
    
    attr_accessor :themes
    
    def initialize
      @themes = []
    end
    
    class << self
      def add(theme_name, options={})
        instance.themes << Theme.new(theme_name, options)
      end
    end
  end
end