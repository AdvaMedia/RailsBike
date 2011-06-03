class Component
  include Railsbike::Document
  
  field :section_name, type: String
  field :module, type: String
  field :options, type: Hash, default: {}
  
  belongs_to :page
end