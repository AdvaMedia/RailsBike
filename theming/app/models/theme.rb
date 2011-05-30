class Theme
  include Mongoid::Document
  field :name
  field :template_name
  belongs_to  :template
  has_and_belongs_to_many  :css_files
end