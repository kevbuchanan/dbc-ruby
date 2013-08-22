require_relative 'dbc/dbc_object'
require_relative 'dbc/user'
require_relative 'dbc/cohort'
require_relative 'dbc/challenge'
require_relative 'dbc/exercise'
require_relative 'dbc/api_key'
require_relative 'dbc/challenge_attempt'
require_relative 'dbc/exercise_attempt'

require 'json'
require 'rest_client'

module DBC
  @api_url = 'http://localhost:3000/v1' #TODO: live site
  @token = nil
  @shared_token = nil

  def self.token=(token)
    @token = token
  end

  def self.token
    @token ||= ENV['DBC_API']
  end

  def self.shared_token=(token)
    @shared_token = token
  end

  def self.shared_token
    @shared_token ||= ENV['DBC_SHARED']
  end

  def self.request(path, options = {})
    raise ArgumentError.new "You must set ENV['DBC_API'] to your api token" unless self.token
    response = RestClient.get(@api_url + path, {accept: :json, authorization: 'DBC-API' + ' ' + @token, params: options})
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.request_with_shared_token(path, options = {})
    raise ArgumentError.new "You must set ENV['DBC_SHARED'] to your shared token" unless self.shared_token
    response = RestClient.get(@api_url + path, {accept: :json, authorization: 'DBC-SHARED' + ' ' + @shared_token , params: options})
    JSON.parse(response.body, symbolize_names: true)
  end
end

