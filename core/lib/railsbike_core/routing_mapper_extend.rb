module RailsbikeCore
  module RoutingMapperExtend
    module ClassMethods
      
    end
    
    module InstanceMethods
      def railsbike_admin(path = RailsbikeConfig.godmode, options = {})
        path = path.to_s
        options = { :path => path, :as => "admin", :module=>"admin",
                    :shallow_path => path, :shallow_prefix => path }.merge!(options)
        scope(options) { yield }
      end #railsbike_admin(options = {})
    end
    
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end

ActionDispatch::Routing::Mapper.send(:include, RailsbikeCore::RoutingMapperExtend)