class AppConfiguration < Configuration
  
  preference :site_name, :string, :default => 'RailsBike Demo Site'
  preference :default_locale, :string, :default => 'en'
  preference :allow_locale_switching, :boolean, :default => true
  
  validates :name, :presence => true, :uniqueness => true
end