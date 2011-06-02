module Theming
  module Parsers
    class TagsRepository
      include Singleton
      
      attr_accessor :blocks
      attr_accessor :tags
      
      def initialize
        @blocks, @tags = [], []
      end
      
      def register_as(klass=nil, type=:block)
        case type
        when :tag
          @tags << klass
        else
          @blocks << klass
        end
      end
      
      class << self
        def register_as(item = nil, type=:block)
          instance.register_as(item, type)
        end
      end
    end
  end
end