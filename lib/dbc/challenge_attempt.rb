require_relative '../dbc'

module DBC
	class ChallengeAttempt
		def initialize(attributes)
			@attributes = attributes
		end

		def self.create_challenge_attempt(challenge_attempt)
      challenge_attempt[:challenge_attempt] = DBC::ChallengeAttempt.new(challenge_attempt[:challenge_attempt])
      challenge_attempt
		end

		def self.create_challenge_attempts(challenge_attempts)
			challenge_attempts[:challenge_attempts].map! do |challenge_attempt|
				DBC::ChallengeAttempt.new(challenge_attempt)
			end
			challenge_attempts
		end

		def self.find(id, user_id)
			endpoint = "/users/#{user_id}/challenge_attempts/#{id}"
			challenge_attempt = DBC.request(endpoint)
			self.create_challenge_attempt(challenge_attempt)
		end

		def self.all(options = {})
			endpoint = "/users/#{user_id}/challenge_attempts"
			challenge_attempts = DBC.request(endpoint, options)
			self.create_challenge_attempts(challenge_attempts)
		end
	end
end
