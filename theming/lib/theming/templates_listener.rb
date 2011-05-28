module RailsbikeTheming
  class TemplatesListener
    include Singleton
    
    attr_accessor :templates
    
    def initialize
      @templates = []
    end
    
    class << self
      def add(template_name, options={}, path)
        template = Template.new(template_name, options, path)
        instance.templates << template
        template.init_themes!
      end
    end
  end
end