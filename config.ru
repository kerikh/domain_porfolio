require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use ServicesController
use DomainNamesController
use UsersController
run ApplicationController