module DBC
  class User < DbcObject
    def self.endpoint(id = '')
      "/users/" + id.to_s
    end

    def challenge_attempts
      ChallengeAttempt.all(@id)
    end

    def exercise_attempts
      ExerciseAttempt.all(@id)
    end

    def cohort
      Cohort.find(@cohort_id)
    end
  end
end
