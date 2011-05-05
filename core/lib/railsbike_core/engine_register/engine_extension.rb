module EngineRegister
  module EngineExtension
    module ClassMethods
      attr_accessor :ext_name
      attr_accessor :show_in_menu
      
      def present_engines
        subclasses.reject{|i| i.ext_name.nil?}
      end
    end
    
    module InstanceMethods
    end
    
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end

Rails::Engine.send(:include, EngineRegister::EngineExtension)