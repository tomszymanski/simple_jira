class GetHttpsJson
  attr_reader :json

  def initialize(query = String.new)
    @config = ReadConfig.new
    uri = URI(URI::encode(@config.search_uri + query))

    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https',
      :openssl_verify_mode => 'none') do |http|

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth @config.username, @config.password

      response = http.request request

      @json = JSON.parse(response.body)
    end
  end
end
