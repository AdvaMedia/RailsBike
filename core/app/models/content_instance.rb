class ContentInstance
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  include CustomFields::ProxyClassEnabler
  
  ## fields (dynamic fields) ##
  field :_slug
  field :_position_in_list, :type => Integer, :default => 0
  field :_visible, :type => Boolean, :default => true
  
  ## associations ##
  embedded_in :content_type, :inverse_of => :contents
  
  
  def highlighted_field_value
    self.send(self.content_type.highlighted_field_name)
  end
  alias :_label :highlighted_field_value
  
  def visible?
    self._visible || self._visible.nil?
  end

  def errors_to_hash
    Hash.new.replace(self.errors)
  end

  def reload_parent!
    self.class.reload_parent!
  end

  def self.reload_parent!
    self._parent = self._parent.reload
  end
  
  def to_liquid
    RailsbikeCore::LiquidSupport::Drops::Content.new(self)
  end
  
end