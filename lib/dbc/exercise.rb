module DBC
  class Exercise < DbcObject
    def self.endpoint(id = '')
      "/exercises/" + id.to_s
    end
  end
end
