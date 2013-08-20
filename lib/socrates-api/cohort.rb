require_relative 'user'

module Socrates
  class Cohort
    def initialize(attributes)
      @id = attributes[:id]
      @name = attributes[:name]
      @email = attributes[:email]
      @location = attributes[:location]
      @start_date = attributes[:start_date]
      @in_sesstion = attributes[:in_session]
      @students = create_students(attributes[:students])
    end

    def create_students(students)
      students.map do |student|
        User.new(student)
      end
    end
  end
end
