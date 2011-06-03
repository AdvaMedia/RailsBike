class ContentType
  include Railsbike::Document
  
  field :name
  field :description
  field :slug
  field :order_by
  field :order_direction, :default => 'asc'
  
  embeds_many :contents, :class_name => 'ContentInstance', :validate => false
  
  ## behaviours ##
  custom_fields_for :contents
end