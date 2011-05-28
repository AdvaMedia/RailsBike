Page.class_eval do
  field :template_name
  field :theme_name
  field :inherit_template, type: Boolean, default: true
  field :inherit_theme, type: Boolean, default: true
  
  def layout
    template.nil? ? nil : template.name
  end
  
  def template
    self.inherit_template ? (self.parent.nil? ? nil : self.parent.template) : RailsbikeTheming::TemplateRegistrator.templates.select{|t| t.name==self.template_name}.first
  end
  
  def theme
    inherit_theme ? parent.nil? ? nil : parent.theme : Theme.where(:name=>self.theme_name, :template_name=>self.template_name).first
  end
end