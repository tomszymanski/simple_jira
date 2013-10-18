require 'rubygems'
require 'json'
require 'open-uri'
require 'net/http'
require 'yaml'

def read_config
  config = YAML.load_file('config.yml')
  @username = config['config']['username']
  @password = config['config']['password']
  @basic_uri = config['config']['host']+config['api']['api_version']
  @search_uri = @basic_uri+config['api']['search']
  @query = config['query']
end

def get_jira_json(jira_uri,additional_params)
  uri=URI(URI::encode(jira_uri+additional_params))

  Net::HTTP.start(uri.host, uri.port,
    :use_ssl => uri.scheme == 'https') do |http|

    request = Net::HTTP::Get.new uri.request_uri
    request.basic_auth @username, @password

    response = http.request request # Net::HTTPResponse object

    json_response = JSON.parse(response.body)
    puts json_response["total"]
  end
end

get_jira_json(@search_uri,@query['code_review'])
