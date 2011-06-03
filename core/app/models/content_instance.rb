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
end