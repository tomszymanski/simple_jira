require 'rubygems'
require 'json'
require 'open-uri'
require 'net/http'
require 'yaml'

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

def get_jira_json(jira_uri,additional_params)
  uri=URI(URI::encode(jira_uri+additional_params))

  Net::HTTP.start(uri.host, uri.port,
    :use_ssl => uri.scheme == 'https') do |http|

    request = Net::HTTP::Get.new uri.request_uri
    request.basic_auth @username, @password

    response = http.request request

    json_response = JSON.parse(response.body)
    return json_response
  end
end

def display_query_result(key_you_want_to_display)
  read_config
  @query.each do |query_name,query|
    total = get_jira_json(@search_uri,query)[key_you_want_to_display]
    puts "#{query_name} : #{total}"
  end
end

display_query_result('total')