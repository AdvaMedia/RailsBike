module Railsbike
  module ConfigurationAccess
    def self.included(base)
      class << base
        def get(key = nil)
          key = key.to_s if key.is_a?(Symbol)
          return nil unless config = self.instance
          # preferences will be cached under the name of the class including this module (ex. Railsbike::Config)
          prefs = Rails.cache.fetch("configuration_#{config.class.name}".to_sym) { config.preferences }
          return prefs if key.nil?
          prefs[key]
        end

        # Set the preferences as specified in a hash (like params[:preferences] from a post request)
        def set(preferences={})
          config = self.instance
          preferences.each do |key, value|
            config.set_preference(key, value)
          end
          save_config_and_clear_cache config
        end
        
        # Set value like hash value (ex. Railsbike::Config[:site_name] = "Railsbike Debo Site")
        def set_as_hash(key, value)
          config = self.instance
          config.set_preference(key, value)
          save_config_and_clear_cache config
        end

        alias_method :[], :get
        alias_method :[]=, :set_as_hash
        
        private
        
        def save_config_and_clear_cache(conf)
          conf.save
          Rails.cache.delete("configuration_#{conf.class.name}".to_sym)
        end
      end
    end
  end
end