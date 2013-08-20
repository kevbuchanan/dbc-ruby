require_relative '../dbc'

module DBC
  class Cohort
    def initialize(attributes)
      @attributes = attributes
    end

    def self.all(options = {})
      endpoint = '/cohorts?'
      endpoint += "page=#{options[:page]}&" if options[:page]
      endpoint += "per_page=#{options[:per_page]}" if options[:per_page]
      cohorts = DBC.request(endpoint)
      self.create_cohorts(cohorts)
    end

    def self.find(id)
      endpoint = "/cohorts/#{id}"
      cohort = DBC.request(endpoint)
      self.create_cohort(cohort)
    end

    def self.create_cohorts(cohorts)
      cohorts[:cohorts].map! do |cohort|
        DBC::Cohort.new(cohort)
      end
      cohorts
    end

    def self.create_cohort(cohort)
      cohort[:cohort] = DBC::Cohort.new(cohort[:cohort])
      cohort
    end
  end
end
