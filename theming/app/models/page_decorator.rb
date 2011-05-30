Page.class_eval do
  field :template_name
  field :theme_name
  field :inherit_template, type: Boolean, default: true
  field :inherit_theme, type: Boolean, default: true
  
  has_and_belongs_to_many :excluded_css_files, :class_name => "CssFile"
  has_and_belongs_to_many :aditional_css_files, :class_name => "CssFile"
  
  attr_reader :css_files
  
  def layout
    template.nil? ? nil : "templates/#{template.name}/template"
  end
  
  def template
    self.inherit_template ? (self.parent.nil? ? nil : self.parent.template) : Template.where(:name=>self.template_name).first
  end
  
  def theme
    inherit_theme ? parent.nil? ? nil : parent.theme : Theme.where(:name=>self.theme_name, :template_name=>self.template_name).first
  end
  
  #TODO: get css files for each block in page
  def blocks_css_files
    []
  end #blocks_css_files
  
  #Fetching all css files in this page.. for create 'spockedded_file'
  def css_files
    @css_files ||= Rails.cache.fetch("css_files_for_page-#{id}"){
      ret = (template.nil? ? [] : template.css_files) + blocks_css_files + aditional_css_files
      ret ret - excluded_css_files
      ret
    }
    @css_files
  end
end