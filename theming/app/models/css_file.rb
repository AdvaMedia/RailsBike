class CssFile < ActiveRecord::Base
  acts_as_nested_set :dependent => :destroy # rather than :delete_all
end