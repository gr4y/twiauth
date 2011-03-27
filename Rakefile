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

desc "generate rdoc"
require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "twiauth #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "run all specs"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :test => [:check_dependencies, :spec]
task :default => [:test, :build]