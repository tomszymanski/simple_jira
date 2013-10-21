require 'rubygems'
require 'json'
require 'open-uri'
require 'net/http'
require 'yaml'

require_relative 'gethttpsjson'
require_relative 'readconfig'

class SimpleJira

  def initialize(key_you_want_to_display='total')
    config = ReadConfig.new

    config.query.each do |query_name,query|
      json = GetHttpsJson.new(
        config.username,
        config.password,
        config.search_uri,
        query
      ).json
      value = json[key_you_want_to_display]
      puts "#{query_name} : #{value}"
    end

  end

end

SimpleJira.new
