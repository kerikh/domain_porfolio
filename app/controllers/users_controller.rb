class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      @user = current_user
      redirect "/"
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty? || User.find_by(username: params[:username])
      flash[:message] = "An entry field is empty or the Username already exists."
      redirect to "/signup"
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect "/"
      else
        redirect '/signup'
      end
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      @user = current_user
      redirect "/"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/"
    else
      flash[:message] = "Please signup before logging in."
      erb :'users/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect "/login"
    else
      redirect "/"
    end
  end

end