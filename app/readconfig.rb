class ReadConfig
    attr_reader :username,:password,:basic_uri,:search_uri,:query,:host

    def initialize
        config = YAML.load_file('config/config.yml')
        query = YAML.load_file('config/query.yml')
        api = YAML.load_file('config/api.yml')

        @username = config['config']['username']
        @password = config['config']['password']
        @basic_uri = config['config']['host']+api['api']['api_version']
        @search_uri = @basic_uri+api['api']['search']
        @host = config['config']['host']
        @query = query['query']
    end
end