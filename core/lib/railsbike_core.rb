require "rails/all"
require "singleton"

require 'railsbike_core/active_ext/active_record'

require 'railsbike_core/preferences/model_hooks'
require 'railsbike_core/preferences/preference_definition'

require 'railsbike/configuration_access'
require 'railsbike/config'

require 'railsbike_core/engine_register/engine_extension'

require 'railsbike_core/theme_support'
require 'railsbike_core/liquid_support'

require 'railsbike_core/railtie'

require 'railsbike_base'

module RailsbikeCore
  # Your code goes here...
end
