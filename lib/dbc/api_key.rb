 require_relative '../dbc'

module DBC
	class ApiKey
		def initialize(attributes)
			@attributes = attributes
		end

		def self.create_api_key(api_key)
      api_key[:api_key] = DBC::ApiKey.new(api_key[:api_key])
      api_key
		end

		def self.find(id)
			endpoint = "/api_keys/#{id}"
			api_key = DBC.request(endpoint)
			self.create_api_key(api_key)
		end
	end
end
