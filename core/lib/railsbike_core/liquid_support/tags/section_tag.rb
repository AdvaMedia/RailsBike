module RailsbikeCore::LiquidSupport::Tags
  class SectionTag < Liquid::Tag
  NamedSyntax  = /^(#{Liquid::QuotedFragment})\s*\:\s*(.*)/
  
    def initialize(tag_name, markup, tokens)
      @attributes = {}
      variables_from_string(markup)
      @name = $1
    end
    
    def render(context)
      ap context.environments
      context.registers[:sections] ||= Hash.new(0)
      context.registers[:sections][@attributes['name']] = @attributes['name']
      context.stack do
        "content_area - #{@attributes['name']} - #{context.registers[:sections].count}"
      end
    end
  
    def variables_from_string(markup)
      markup.scan(Liquid::TagAttributes) do |key, value|
        @attributes[key] = value.gsub("'",'')
      end
    end
  end
end

Liquid::Template.register_tag('section', RailsbikeCore::LiquidSupport::Tags::SectionTag)