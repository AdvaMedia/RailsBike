class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments
  has_and_belongs_to_many :permissions
end