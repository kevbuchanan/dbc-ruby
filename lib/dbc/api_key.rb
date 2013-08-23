module DBC
	class ApiKey < DbcObject
		def self.endpoint(id)
			"/api_keys/" + id.to_s
		end

    def self.find(id)
      api_response = DBC.request_with_shared_token(self.endpoint(id))
      self.create_dbc_object(api_response)
    end
	end
end
