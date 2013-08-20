require_relative '../dbc'

module DBC
  class User
    def initialize(attributes)
      @attributes = attributes
    end

    def self.all(options = {})
      endpoint = '/users'
      users = DBC.request(endpoint, options)
      self.create_users(users)
    end

    def self.find(id)
      endpoint = "/users/#{id}"
      user = DBC.request(endpoint)
      self.create_user(user)
    end

    private

    def self.create_users(users)
      users[:users].map! do |user|
        DBC::User.new(user)
      end
      users
    end

    def self.create_user(user)
      user[:user] = DBC::User.new(user[:user])
      user
    end
  end
end
