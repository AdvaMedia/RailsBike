class Template
  include Mongoid::Document
  field :name
  field :path
  has_many  :themes
  has_many  :css_files
  
  
  #def init_themes!
  #  @options["themes"].each do |theme|
  #    Theme.find_or_create_by(:name=>theme, :template_name=>self.name)
  #  end
  #  return themes.count
  #end
  
end #Template