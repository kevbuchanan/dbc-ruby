require_relative '../dbc'

module DBC
	class ExerciseAttempt
		def initialize(attributes)
			@attributes = attributes
		end

		def self.create_exercise_attempt(exercise_attempt)
      exercise_attempt[:exercise_attempt] = DBC::ExerciseAttempt.new(exercise_attempt[:exercise_attempt])
      exercise_attempt
		end

		def self.create_exercise_attempts(exercise_attempts)
			exercise_attempts[:exercise_attempts].map! do |exercise_attempt|
				DBC::ExerciseAttempt.new(exercise_attempt)
			end
			exercise_attempts
		end

		def self.find(id, user_id)
			endpoint = "/users/#{user_id}/exercise_attempts/#{id}"
			exercise_attempt = DBC.request(endpoint)
			self.create_exercise_attempt(exercise_attempt)
		end

		def self.all(options = {})
			endpoint = "/users/#{user_id}/exercise_attempts"
			exercise_attempts = DBC.request(endpoint, options)
			self.create_exercise_attempts(exercise_attempts)
		end
	end
end
