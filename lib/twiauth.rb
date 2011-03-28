require 'oauth'
require 'twiauth/client'
require 'json'

module TwiAuth
  LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
  VERSION = ::File.exist?(PATH + 'VERSION') ? ::File.read(PATH+'VERSION') : ""
end