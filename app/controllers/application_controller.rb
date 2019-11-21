require 'sinatra/base'
require 'sinatra/flash'
class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "secret"
  end

  get "/" do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end
  end


end