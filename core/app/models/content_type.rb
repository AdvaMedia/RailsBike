class ContentType
  include Railsbike::Document
  include Extensions::ContentType::Templated
  
  field :name
  field :description
  field :slug
  field :order_by
  field :order_direction, :default => 'asc'
  field :highlighted_field_name
  field :group_by_field_name
  
  embeds_many :contents, :class_name => 'ContentInstance', :validate => false
  
  ## behaviours ##
  custom_fields_for :contents
  
  def to_liquid
    RailsbikeCore::LiquidSupport::Drops::Content.new(self)
  end
  
  def item_in_collection
    #item.send(item._parent.highlighted_field_name.to_sym)
    "test"
  end
end