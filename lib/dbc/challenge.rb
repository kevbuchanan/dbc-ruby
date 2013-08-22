require_relative '../dbc'

module DBC
	class Challenge
		def initialize(attributes)
			@attributes = attributes
		end

		def self.all(options = {})
			endpoint = '/challenges'
			challenges = DBC.request(endpoint, options)
			self.create_challenges(challenges)
		end

		def self.find(id)
			endpoint = "/challenges/#{id}"
			challenge = DBC.request(endpoint)
			self.create_cohort(challenge)
		end

		private

		def self.create_challenge(challenge)
			challenge[:challenge] = DBC::Challenge.new(challenge[:challenge])
			challenge
		end

		def self.create_challenges(challenges)
			challenges[:challenges].map! do |challenge|
				DBC::Challenge.new(challenge)
			end
			challenges
		end
	end
end