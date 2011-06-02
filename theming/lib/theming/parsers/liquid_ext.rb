module Theming
  module Parsers
    module LiquidExt
      module ClassMethods

      end

      module InstanceMethods
        def tags
          @tags ||= recognize_registreded(:tags)
        end
        
        def blocks
          @blocks ||= recognize_registreded(:blocks)
        end

        protected

        def recognize_registreded(type)
          @root.nodelist.select{|node| Theming::Parsers::TagsRepository.instance.send(type).include?(node.class)}
        end
      end

      def self.included(receiver)
        receiver.extend         ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end

Liquid::Template.send(:include, Theming::Parsers::LiquidExt)