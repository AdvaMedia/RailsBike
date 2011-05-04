%W{hook hook_listener hook_modifier}.each do |fname|
  require "railsbike_core/theme_support/#{fname}"
end