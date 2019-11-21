# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all' #=> Helps to load dependencies
gem 'sqlite3'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem "tux"
gem 'rack-flash3'
gem 'sinatra-flash'
gem 'json'

group :development, :test do
  gem "dotenv"
  gem "rspec"
  gem "capybara"
  gem "sqlite3"
  gem "rack-test"
  gem "database_cleaner"
end