class CssFile
  include Mongoid::Document
  field :name
  field :full_path
  field :content
  field :editable, type: Boolean
  
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :pages
  belongs_to  :template
  #acts_as_nested_set :dependent => :destroy # rather than :delete_all
  
  def abstract_path
    File.join("/assets", "stylesheets", "templates", self.template.name, self.name)
  end
  
  def sass_path
    File.join("templates", self.template.name, self.name)
  end
end