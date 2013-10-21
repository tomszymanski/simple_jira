require 'rubygems'
require 'json'
require 'open-uri'
require 'net/http'
require 'yaml'

require_relative 'gethttpsjson'

class SimpleJira

  def read_config
    config = YAML.load_file('config/config.yml')
    query = YAML.load_file('config/query.yml')
    api = YAML.load_file('config/api.yml')

    @username = config['config']['username']
    @password = config['config']['password']
    @basic_uri = config['config']['host']+api['api']['api_version']
    @search_uri = @basic_uri+api['api']['search']

    @query = query['query']
  end

  def display_query_result(key_you_want_to_display)
    read_config
    @query.each do |query_name,query|
      json = GetHttpsJson.new(@username,@password,@search_uri,query).json
      total = json[key_you_want_to_display]
      puts "#{query_name} : #{total}"
    end
  end

end

SimpleJira.new.display_query_result('total')