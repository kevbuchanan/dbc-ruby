module DBC
	class ExerciseAttempt < DbcObject
		def self.endpoint(user_id, id = '')
			"/users/#{user_id}/exercise_attempts/" + id
		end

		def self.find(user_id, id)
			api_response = DBC.request(endpoint(user_id, id))
			self.create_dbc_object(api_response)
		end

		def self.all(user_id, options = {})
			api_response = DBC.request(endpoint(user_id), options)
			self.create_dbc_objects(api_response)
		end

		def exercise
			Exercise.find(@exercise_id)
		end
	end
end
