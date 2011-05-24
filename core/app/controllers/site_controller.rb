class SiteController < Railsbike::BaseController
  before_filter :find_page
  after_filter  :process_liquid
  
  def show
    
  end
  
  def find_page
    @page_slug = params.fetch("segments", "")
    @page_slug = "/#{@page_slug}" unless @page_slug.blank?
    @page = Page.where(:full_url=>@page_slug).first
    
    unless @page.blank?
      return true
    else
      page_not_found
      return false
    end
  end
  
  def process_liquid
    self.response.body = Liquid::Template.parse(self.response.body).render(params)
  end
  
  private
  
  def page_not_found
    render :file => "#{Rails.root}/public/404.html", :status=>404
  end
end