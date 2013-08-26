#DBC API Ruby Client

## Installation

If you want to use the Dev Bootcamp (DBC) Ruby gem, run:

	gem install dbc-ruby

## Configuration

You must have an api key to make api requests with this gem.
You can see your api key by logging in at [developer.devbootcamp.com](http://developer.devbootcamp.com)

Set your DBC_API environment variable to your api key, or use the gem to configure your key:
```ruby
DBC::token = # your api key
```
For making requests between DBC shared applications, you must also congifure the shared key.
Set your DBC_SHARED environment variable to the shared key, or use the gem:
```ruby
DBC::shared_token = # the shared token
```

## Methods

### User

Class methods:

```ruby
DBC::User.all() # => all users
DBC::User.all(page: 1, per_page: 10) # => first 10 users
DBC::User.find(id) # => a specific user by user_id
```

Instance methods:

```ruby
user.cohort # => a specific user's cohort object
user.challenge_attempts # => a user's challenge attempts
user.exercise_attempts # => a user's exercies attempts
```

### Cohort

Class methods:

```ruby
DBC::Cohort.all() # => all cohorts
DBC::Cohort.all(page: 1, per_page: 10) # => first 10 cohorts
DBC::Cohort.find(id) # => a specific cohort by user_id
```

### Challenge

### ChallengeAttempt

### Exercise

### ExerciseAttempt
