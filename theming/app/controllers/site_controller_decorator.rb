SiteController.class_eval do
  layout :load_page_layout
  
  def load_page_layout
    @page.nil? ? nil : @page.layout
  end
end