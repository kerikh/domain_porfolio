ENV["SINATRA_ENV"] ||= "development"
ENV["RACK_ENV"] ||= "development"

require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}_portfolio.sqlite"
)

require 'dotenv'
Dotenv.load

require 'sinatra/flash'
require_all 'app'

