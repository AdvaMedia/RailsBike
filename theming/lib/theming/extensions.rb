Dir.glob(File.join(File.dirname(__FILE__), 'extensions/**/*.rb')) do |file|
  require file
end