# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "url_formatter/version"

Gem::Specification.new do |s|
  s.name        = "url_formatter"
  s.version     = UrlFormatter::VERSION
  s.authors     = ["Ryan Bates"]
  s.email       = ["ryan@railscasts.com"]
  s.homepage    = "https://github.com/ryanb/url_formatter"
  s.summary     = %q{Format and validate a URL in Active Record}
  s.description = %q{Example of creating a Ruby Gem for RailsCasts episode #301}

  s.rubyforge_project = "url_formatter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "supermodel"
end
