require_relative 'dbc/cohort'
require_relative 'dbc/user'
require 'net/http'
require 'uri'
require 'json'
require 'rest_client'

module DBC
  @@api_url = 'http://localhost:3000/v1'
  @@token = nil

  def self.token=(token)
    @@token = token
  end

  def self.token
    @@token ||= ENV['DBC-API']
  end

  def self.request(path)
    response = RestClient.get(@@api_url + path, {accept: :json, authorization: 'DBC-API' + ' ' + token})
    JSON.parse(response.body, symbolize_names: true)
  end
end

