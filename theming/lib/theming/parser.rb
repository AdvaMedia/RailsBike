[:parsers, :liquid].each do |dir|
  Dir.glob(File.join(File.dirname(__FILE__), "#{dir}/**/*.rb")) do |file|
    require file
  end
end