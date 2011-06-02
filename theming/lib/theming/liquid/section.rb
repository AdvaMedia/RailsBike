module Theming
  module Liquid
    class Section < Block
      
      Syntax = /(#{::Liquid::Expression}+)?/
      
      def initialize(tag_name, markup, tokens)
        if markup =~ Syntax
          @slug = $1
          @options = {}
          markup.scan(::Liquid::TagAttributes) { |key, value| @options[key.to_sym] = value.gsub(/"|'/, '') }
        else
          raise ::Liquid::SyntaxError.new("Syntax Error in 'section' - Valid syntax: slug")
        end

        super
      end
      
      
      def render(content)
        "TODO: implement SECTION tag !!!"
      end
      
    end
    
    ::Liquid::Template.register_tag('section', Section)
    Theming::Parsers::TagsRepository.register_as(Section, :block)
  end
end