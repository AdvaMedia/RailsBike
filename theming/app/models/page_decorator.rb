Page.class_eval do
  def layout
    if inherit_layout
      return parent.nil? ? nil : parent.layout
    else
      return "themes/#{layout_name}/theme"
    end
  end
end