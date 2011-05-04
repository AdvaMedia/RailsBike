module Railsbike
  class Config
    include Singleton
    include Railsbike::ConfigurationAccess
    
    class << self
      def instance
        return @configuration if @configuration
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        @configuration ||= AppConfiguration.find_or_create_by_name("Default configuration")
        @configuration
      end
    end
  end
end