module Socrates
  class Client
    require 'net/http'
    require 'uri'
    require 'json'

    ENDPOINT = 'https://api.devbootcamp.com/v1'

    def token
      @token ||= ENV['DBC-API']
    end

    def get(path, params = {})
      endpoint = ENDPOINT + path
      request(endpoint)
    end

    def request(path)
      uri = URI.parse(path)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      request.add_field('Authorization', token)
      request.add_field('Accept', 'application/json')
      response = http.request(request)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
