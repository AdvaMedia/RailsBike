class Page < ActiveRecord::Base
  #acts_as_nested_set :dependent => :destroy # rather than :delete_all
  liquid_methods << :created_at
end