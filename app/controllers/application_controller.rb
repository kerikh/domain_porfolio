require 'sinatra/base'
require 'sinatra/flash'
class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure do
    set :public_folder, 'public', 'node_modules'
    set :views, 'app/views'
    set :session_secret, "secret"
  end

  get "/" do
    authenticate_user
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find(id: session[:user_id])
    end

    def authenticate_user
      if !logged_in?
        flash[:message] = "You must be logged in to view the page."
        redirect "/login"
      end
    end
  end


end