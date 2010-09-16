require 'oauth'
require 'twiauth/oauth'
require 'twiauth/store'
require 'yaml'

module TwiAuth
  LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
  STORE_PATH = ::File.expand_path("~" + ::File::SEPARATOR + "twiauth") + ::File::SEPARATOR
  VERSION = ::File.exist?(PATH + 'VERSION') ? ::File.read(PATH+'VERSION') : ""
end