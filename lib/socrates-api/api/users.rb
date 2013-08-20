require_relative '../client'
require_relative '../user'

module Socrates
  module Users
    def self.get(options = {})
      endpoint = '/users?'
      endpoint += "page=#{options[:page]}&" if options[:page]
      endpoint += "per_page=#{options[:per_page]}" if options[:per_page]
      users = Client.new.get(endpoint)
      self.create_users(users)
    end

    def self.find(id)
      endpoint = "/users/#{id}"
      user = Client.new.get(endpoint)
      self.create_user(user)
    end

    def self.create_users(users)
      users[:users].map! do |user|
        Socrates::User.new(user)
      end
      users
    end

    def self.create_user(user)
      user[:user] = Socrates::User.new(user[:user])
      user
    end
  end
end
