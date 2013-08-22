require_relative 'dbc/api_key'
require_relative 'dbc/challenge'
require_relative 'dbc/challenge_attempt'
require_relative 'dbc/cohort'
require_relative 'dbc/exercise'
require_relative 'dbc/exercise_attempt'
require_relative 'dbc/user'

require 'json'
require 'rest_client'

module DBC
  @api_url = 'http://localhost:3000/v1' #TODO: live site
  @token = nil

  def self.token=(token)
    @token = token
  end

  def self.token
    @token ||= ENV['DBC_API']
  end

  def self.request(path, options = {})
    raise ArgumentError.new "You must set your ENV['DBC_API'] to your token" if @token == nil
    response = RestClient.get(@api_url + path, {accept: :json, authorization: 'DBC-API' + ' ' + token, params: options})
    JSON.parse(response.body, symbolize_names: true)
  end
end

