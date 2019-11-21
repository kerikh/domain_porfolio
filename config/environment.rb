ENV["SINATRA_ENV"] = "development"
ENV["RACK_ENV"] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])


ActiveRecord::Base.establish_connection

require 'sinatra/base'
require 'sinatra/flash'
require_all 'app'

