# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "railsbike_auth/version"

Gem::Specification.new do |s|
  s.name        = "railsbike_auth"
  s.version     = Auth::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TODO: Write your name"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "auth"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'rails', '>= 3.0.0'
  s.add_dependency 'railsbike_core'
  s.add_dependency 'devise'
  s.add_dependency 'omniauth'
  s.add_dependency 'cancan'
end
