module RailsbikeAuth
  class Config
    include Singleton
    include Railsbike::ConfigurationAccess
    
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        RailsbikeAuthConfiguration.find_or_create_by_name("Default railsbike_auth configuration")
      end
    end
  end
end