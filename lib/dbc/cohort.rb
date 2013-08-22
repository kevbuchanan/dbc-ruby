module DBC
  class Cohort < DbcObject
    def initialize(attributes)
      super
      @students.map! { |user| DBC::User.new(user) }
    end

    def self.endpoint(id = '')
      "/cohorts/" + id.to_s
    end
  end
end
