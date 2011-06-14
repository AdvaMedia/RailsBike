class Page
  include ::Mongoid::Document
  acts_as_nested_set :dependent => :destroy # rather than :delete_all
  field :slug, default: ""
  has_many :aliases
  liquid_methods << :created_at
  
  after_create  :check_self_alias
  after_save    :update_self_alias
  after_update  :update_self_alias
  
  def full_url
    self.parent.nil? ? "/" : File.join(self.parent.full_url, self.slug)
  end
  
  def self.root_page
    where(:slug=>"").first
  end
    
  protected
  
  def check_self_alias
    Alias.find_or_create_by(:full_url=>self.full_url, :page_id=>self.id)
  end
  
  def update_self_alias
    self.aliases.select{|a| a.save}.count
  end
end