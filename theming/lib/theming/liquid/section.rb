module Theming
  module Liquid
    class Section < Block
      
      Syntax = /(#{::Liquid::Expression}+)?/
      
      def initialize(tag_name, markup, tokens)
        if markup =~ Syntax
          @name = $1
          @options = {}
          markup.scan(::Liquid::TagAttributes) { |key, value| @options[key.to_sym] = value.gsub(/"|'/, '') }
        else
          raise ::Liquid::SyntaxError.new("Syntax Error in 'section' - Valid syntax: slug")
        end

        super
      end
      
      
      def render(context)
        ap @options
        result = []
        ap page
        context.stack do
          context['section_content'] = "CONTENT_FOR section, named #{@name}"
          result << render_all(@nodelist, context)
        end
        
        result
      end
      
    end
    
    ::Liquid::Template.register_tag('section', Section)
    Theming::Parsers::TagsRepository.register_as(Section, :block)
  end
end