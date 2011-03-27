require 'rake'
require 'rubygems'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "twiauth"
    gem.summary = %Q{a very simple twitter authentication wrapper}
    gem.description = %Q{simple twitter authentication wrapper}
    gem.email = "swessel@gr4yweb.de"
    gem.homepage = "http://github.com/gr4y/twiauth"
    gem.authors = ["Sascha Wessel"]
    gem.add_dependency "oauth", ">= 0.4.0"
    gem.add_dependency "rspec", ">= 2.5"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

desc "generate documentation"
require 'yard'
YARD::Rake::YardocTask.new do |yard|
  yard.files = ['lib/**/*.rb']
  yard.options = ["--no-private"]
end

desc "run all specs"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :test => [:check_dependencies, :spec]
task :doc => [:yard]
task :default => [:test, :doc, :build]