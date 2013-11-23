class ReadConfig
  attr_reader :basic_uri,
              :host,
              :password,
              :query,
              :username,
              :search_uri

  def initialize
    config = YAML.load_file('config/config.yml')
    query = YAML.load_file('config/query.yml')
    api = YAML.load_file('config/api.yml')

    @username = config['config']['username']
    @password = config['config']['password']
    @host = config['config']['host']
    @basic_uri = @host + api['api']['api_version']
    @search_uri = @basic_uri + api['api']['search']
    @query = query['query']
  end
end