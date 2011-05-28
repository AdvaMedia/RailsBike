# Initialize preference system
#ActiveRecord::Base.class_eval do
#  include RailsbikeCore::Preferences
#  include RailsbikeCore::Preferences::ModelHooks
#end

#clearing assets_path_cache

Rails.cache.delete('compass_assets_path_extended')