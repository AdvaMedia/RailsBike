class Template
  include Mongoid::Document
  field :name
  field :content
  field :created_at, type: DateTime, default: -> {Time.now}
  field :updated_at, type: DateTime, default: -> {Time.now}
  field :static_stylesheets_ids, type: Array
  
  validates_presence_of :name
  validates_presence_of :content
  
  validates_uniqueness_of :name
  
end