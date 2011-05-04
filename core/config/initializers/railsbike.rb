# Initialize preference system
ActiveRecord::Base.class_eval do
  include RailsbikeCore::Preferences
  include RailsbikeCore::Preferences::ModelHooks
end