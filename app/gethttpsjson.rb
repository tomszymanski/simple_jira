class GetHttpsJson
  attr_reader :json

  def initialize(username,password,uri,additional_params=String.new)
    uri=URI(URI::encode(uri+additional_params))

    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https',
      :openssl_verify_mode => 'none') do |http|

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth username, password

      response = http.request request

      @json = JSON.parse(response.body)
    end
  end
end