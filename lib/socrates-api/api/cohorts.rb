require_relative '../client'
require_relative '../cohort'

module Socrates
  module Cohorts
    def self.get(options = {})
      endpoint = '/cohorts?'
      endpoint += "page=#{options[:page]}&" if options[:page]
      endpoint += "per_page=#{options[:per_page]}" if options[:per_page]
      cohorts = Client.new.get(endpoint)
      self.create_cohorts(cohorts)
    end

    def self.find(id)
      endpoint = "/cohorts/#{id}"
      cohort = Client.new.get(endpoint)
      self.create_cohort(cohort)
    end

    def self.create_cohorts(cohorts)
      cohorts[:cohorts].map! do |cohort|
        Socrates::Cohort.new(cohort)
      end
      users
    end

    def self.create_cohort(cohort)
      cohort[:cohort] = Socrates::Cohort.new(cohort[:cohort])
      cohort
    end
  end
end
