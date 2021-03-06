# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "railsbike_core/version"

Gem::Specification.new do |s|
  s.name        = "railsbike_core"
  s.version     = RailsbikeCore::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TODO: Write your name"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "railsbike_core"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'rails', '>= 3.0.0'
  s.add_dependency 'haml'
  s.add_dependency 'liquid'
  s.add_dependency 'awesome_nested_set', '>= 2.0.0'
  s.add_dependency 'inherited_resources'
  s.add_dependency 'sass'
  s.add_dependency 'coffee-script'
  s.add_dependency 'compass'
end
