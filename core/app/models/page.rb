class Page
  include Mongoid::Document
  acts_as_nested_set :dependent => :destroy # rather than :delete_all
  field :slug
  field :full_url
  liquid_methods << :created_at
  
  def regenerate_full_url
    self.full_url = self.parent.nil? ? "" : [self.parent.full_url, self.slug].join('/')
  end
end