require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"
require "mongoid"
require 'mongoid_nested_set'
require "singleton"
require 'carrierwave'

require 'bson'

require 'inherited_resources'
require 'devise'

require 'liquid'
require 'compass'

require 'railsbike/config'
require 'railsbike/extending'
require 'railsbike/document'
require 'railsbike_core/routing_mapper_extend'
require 'railsbike_core/routing'

require 'railsbike_core/engine_register/engine_extension'

require 'railsbike_core/theme_support'
require 'railsbike_core/liquid_support'

require 'railsbike_core/railtie'

require 'railsbike_base'

module RailsbikeCore
  # Your code goes here...
end
