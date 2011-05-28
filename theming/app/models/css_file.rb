class CssFile
  include Mongoid::Document
  field :name
  field :content
  
  has_and_belongs_to_many :themes
  #acts_as_nested_set :dependent => :destroy # rather than :delete_all
end