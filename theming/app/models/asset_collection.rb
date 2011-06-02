class AssetCollection
  include Mongoid::Document
  include Mongoid::Timestamps
  ## fields ##
  field :name
  field :slug
  
  ## associations ##
  has_many :assets
end