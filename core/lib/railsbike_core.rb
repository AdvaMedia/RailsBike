require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"
require "mongoid"
require 'mongoid_nested_set'
require "singleton"
require 'inherited_resources'

require 'devise'

require 'liquid'
require 'compass'

#require 'railsbike_core/active_ext/active_record'

#require 'railsbike_core/preferences/model_hooks'
#require 'railsbike_core/preferences/preference_definition'

#require 'railsbike/configuration_access'
#require 'railsbike/config'

require 'railsbike_core/engine_register/engine_extension'

require 'railsbike_core/theme_support'
require 'railsbike_core/liquid_support'

require 'railsbike_core/railtie'

require 'railsbike_base'

module RailsbikeCore
  # Your code goes here...
end
