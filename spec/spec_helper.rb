require 'twiauth'
require 'yaml'
require 'json'

def pull_config
  yml_config = YAML.load_file(File.dirname(__FILE__) + "/config.yml")
  yml_config.each do |key, value|
    instance_variable_set("@#{key}", value)
  end
end

def parse_json(object)
  JSON.parser.new(object).parse
end