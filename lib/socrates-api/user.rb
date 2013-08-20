module Socrates
  class User
    def initialize(attributes)
      @id = attributes[:id]
      @name = attributes[:name]
      @email = attributes[:email]
      @cohort_id = attributes[:cohort_id]
      @bio = attributes[:bio]
      @profile = attributes[:profile]
    end
  end
end
