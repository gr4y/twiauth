require 'capybara'
require 'akephalos'
require 'twiauth'
require 'yaml'

RSpec.configure do |config|
  config.before(:all) do
    path = File.dirname(__FILE__)
    @consumer = YAML::load_file("#{path}/config/config.yml")
    @test = YAML::load_file("#{path}/config/test.yml")
    @options = { :access_token => nil }
  end
end