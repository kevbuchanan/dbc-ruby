require_relative '../dbc'

module DBC
	class Exercise
		def initialize(attributes)
			@attributes = attributes
		end

		def self.create_exercise(exercise)
      exercise[:exercise] = DBC::Exercise.new(exercise[:exercise])
      exercise
		end

		def self.create_exercises(exercises)
			exercises[:exercises].map! do |exercise|
				DBC::Exercise.new(exercise)
			end
			exercises
		end

		def self.find(id)
			endpoint = "/exercises/#{id}"
			exercise = DBC.request(endpoint)
			self.create_exercise(exercise)
		end

		def self.all(options = {})
			endpoint = '/exercises'
			exercises = DBC.request(endpoint, options)
			self.create_exercises(exercises)
		end
	end
end
