class Permission
  include Mongoid::Document
  field :subject_class
  field :action
  field :name
  field :description
  has_and_belongs_to_many :roles
end