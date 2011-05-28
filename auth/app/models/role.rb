class Role
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  
  has_many :assignments
  has_many :users, :through => :assignments
  has_and_belongs_to_many :permissions
end