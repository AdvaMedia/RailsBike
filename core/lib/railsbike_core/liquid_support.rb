%w{active_liquid_ext}.each do |incfile|
  require "railsbike_core/liquid_support/#{incfile}"
end

Dir[File.dirname(__FILE__) + '/liquid_support/**/*.rb'].each { |f| require f }