class Asset
  include Mongoid::Document
  #include Mongoid::Timestamps
  
  # fields ##
  field :name, :type => String
  field :size, :type => Integer
  
  ## associations ##
  #belongs_to :collection, :class_name => 'AssetCollection'
  
  ## validations ##
  validates_presence_of :name
  
  %w{image stylesheet javascript pdf media}.each do |type|
    define_method("#{type}?") do
      self.content_type.to_s == type
    end
  end
  
  def extname
    File.extname(self.source_filename).gsub(/^\./, '')
  end
end