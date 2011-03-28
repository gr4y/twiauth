require 'bundler'
Bundler::GemHelper.install_tasks

desc "generate documentation"
require 'yard'
YARD::Rake::YardocTask.new do |yard|
  yard.files = ['lib/**/*.rb']
  yard.options = ["--no-private"]
end

desc "run all specs"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :test => [:spec]
task :doc => [:yard]
task :default => [:test, :doc, :build]