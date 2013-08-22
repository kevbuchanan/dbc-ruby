module DBC
  class Challenge < DbcObject
    def self.endpoint(id = '')
      "/challenges/" + id.to_s
    end
  end
end
