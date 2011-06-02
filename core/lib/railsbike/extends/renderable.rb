module Railsbike
  module Extends
    module Renderable
      
      module InstanceMethods
        def render
          
        end
      end
      
      def self.included(receiver)
        #receiver.extend         ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end