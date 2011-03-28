$:.push File.expand_path("../lib", __FILE__)
require 'twiauth'

Gem::Specification.new do |spec|
  spec.name = "twiauth"
  spec.version = TwiAuth::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Sascha Wessel"]
  spec.email = "swessel@gr4yweb.de"
  spec.homepage = "http://github.com/gr4y/twiauth"
  spec.summary = %Q{a very simple twitter authentication wrapper}
  spec.description = %Q{simple twitter authentication wrapper}

  spec.rubyforge_project = "twiauth"

  spec.files = `git ls-files`.split("\n")
  spec.test_files = `git ls-files -- {test, spec, features}/*`.split("\n")  
  spec.require_paths = ["lib"]

  spec.add_dependency "oauth", "~> 0.4.0"
  spec.add_dependency "rspec", "~> 2.5"
  spec.add_development_dependency "capybara", "~> 0.4.1"
  spec.add_development_dependency "akephalos", "~> 0.2.5"
  
  # see http://www.rubygems.org/read/chapter/20 for additional settings
end