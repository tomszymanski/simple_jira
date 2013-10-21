class ValueFromQuery
  attr_reader :hash

  def initialize(key='total')
    @config = ReadConfig.new
    @hash = Hash.new
    @key = key
  end

  def get_value
    @config.query.each do |query_name,query|
      json = GetHttpsJson.new(
        @config.username,
        @config.password,
        @config.search_uri,
        query
      ).json
      value = json[@key]
      @hash[query_name] = value
    end
  end

  def display_value
    @hash.each do |query_name,value|
      puts "#{query_name}: #{value}"
    end
  end

end