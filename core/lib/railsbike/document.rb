module Railsbike
  module Document
    extend ActiveSupport::Concern
    included do
      require 'custom_fields'
      include ::Mongoid::Document
      include ::Mongoid::CustomFields
    end
  end
end