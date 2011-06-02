class Alias
  include Mongoid::Document
  field :slug, default: ""
  field :full_url
  belongs_to  :page
  
  before_save :update_full_url
  
  protected
  
  def update_full_url
    self.full_url = File.join(self.page.full_url, self.slug) if self.page.present?
  end
end