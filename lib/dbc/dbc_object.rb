module DBC
  class DbcObject
    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.endpoint(id)
      nil
    end

    def self.all(options = {})
      api_response = DBC.request(self.endpoint, options)
      self.create_dbc_objects(api_response)
    end

    def self.find(id)
      api_response = DBC.request(self.endpoint(id))
      self.create_dbc_object(api_response)
    end

    private

    def self.create_dbc_objects(api_response)
      api_response.values.first.map! do |object|
        self.new(object)
      end
      api_response
    end

    def self.create_dbc_object(api_response)
      { api_response.keys.first => self.new(api_response.values.first) }
    end
  end
end
