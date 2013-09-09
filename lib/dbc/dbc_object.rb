module DBC
  class DbcObject
    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
        self.class.send(:attr_reader, key)
      end
    end

    def self.endpoint(id = '')
      '/' + id.to_s
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
      api_response.values.first.map do |object|
        self.new(object)
      end
    end

    def self.create_dbc_object(api_response)
      self.new(api_response.values.first)
    end
  end
end
