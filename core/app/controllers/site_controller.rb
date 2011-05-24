class SiteController < Railsbike::BaseController
  before_filter :find_page
  after_filter  :process_liquid
  
  def show
    
  end
  
  def find_page
    @page_slug = params.fetch("segments", "")
    @page = Page.where(:slug=>@page_slug).first
  end
  
  def process_liquid
    self.response.body = Liquid::Template.parse(self.response.body).render(params)
  end
end