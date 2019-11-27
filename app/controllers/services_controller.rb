class ServicesController < ApplicationController

  get '/services' do
    authenticate_user
    @services = Service.all.where(user_id: session[:user_id])
    erb :'services/index'
  end

  get '/services/new' do
    authenticate_user
    erb :'services/new'
  end

  post '/services' do
    authenticate_user
    if params[:service_name].empty?
      redirect '/services/new'
    else
      @service = Service.new
      @service.service_name = params[:service_name]
      @service.expiry_date = params[:expiry_date]
      @service.user_id = session[:user_id]
      @service.save
      if @service
        redirect '/services'
      end
    end
  end


  get '/services/:id' do
    authenticate_user
    @service = Service.find_by_id(params[:id])
    erb :'services/show'
  end

  get '/services/:id/edit' do
    authenticate_user
    @service = Service.find_by_id(params[:id])
    if @service.user_id == session[:user_id]
      erb :'services/edit'
    else
      flash[:message] = "Sorry, but that one doesn't belong to you."
      redirect "/login"
    end
  end

  patch '/services/:id' do
    authenticate_user
    if params[:service_name].empty? || params[:expiry_date].empty?
      redirect "/services/#{params[:id]}/edit"
    else
      @service = Service.find_by_id(params[:id])
      @service.update(service_name: params[:service_name], expiry_date: params[:expiry_date])
      @service.save
      flash[:message] = "Your service name was successfully updated!"
      redirect "/services/#{@service.id}"
    end
  end

delete '/services/:id/delete' do
    authenticate_user
    @service = Service.find_by_id(params[:id])
    if @service.user_id == session[:user_id]
      @service.destroy
      flash[:message] = "Your service name was deleted!"
      redirect '/services'
    else
      redirect '/services'
    end
  end
end