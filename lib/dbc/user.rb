require_relative '../dbc'

module DBC
  class User
    def initialize(attributes)
      @attributes = attributes
    end

    def self.all(options = {})
      endpoint = '/users?'
      endpoint += "page=#{options[:page]}&" if options[:page]
      endpoint += "per_page=#{options[:per_page]}" if options[:per_page]
      users = DBC.request(endpoint)
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
