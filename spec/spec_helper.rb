$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'dbc-ruby'

RSpec.configure do |config|

end
