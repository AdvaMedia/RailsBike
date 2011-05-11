module RailsbikeCore
  module LiquidSupport
    module ActiveLiquidExt
      module ClassMethods

      end
  
      module InstanceMethods
        
        def init_params_hash
          @railsbike_params = {}
          @railsbike_params['template'] = self.send(:_layout)
        end
        
        def parcebody_with_liquid
          init_params_hash
          @template = Liquid::Template.parse(response.body)
          #TODO Удалить параметры из стэка params, которые пойдут в шаблонизатор
          response.body = @template.render({'railsbike'=>@railsbike_params})
        end
      end
  
      def self.included(receiver)
        receiver.extend         ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end