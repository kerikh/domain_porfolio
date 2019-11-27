class DomainNamesController < ApplicationController

  get '/domains' do
    authenticate_user
    @domains = DomainName.all.where(user_id: session[:user_id])
    erb :'domains/index'
  end

  get '/domains/new' do
    authenticate_user
    @services = Service.all.where(user_id: session[:user_id])
    erb :'domains/new'
  end

  post '/domains' do
    authenticate_user
    if params[:domain_name].empty?
      redirect '/domains/new'
    else
      @domain = DomainName.new
      @domain.domain_name = params[:domain_name]
      @domain.expiry_date = params[:expiry_date]
      @domain.service_id = params[:service_id]
      @domain.user_id = session[:user_id]
      @domain.save
      if @domain
        redirect '/domains'
      end
    end
  end

  get '/domains/:id' do
    authenticate_user
    @domain = DomainName.find_by_id(params[:id])
    if @domain.service_id
      @service = Service.find_by_id(@domain.service_id)
    end
    erb :'domains/show'
  end

  get '/domains/:id/edit' do
    authenticate_user
    @domain = DomainName.find_by_id(params[:id])
    if @domain.user_id == session[:user_id]
      erb :'domains/edit'
    else
      flash[:message] = "Sorry, but that one doesn't belong to you."
      redirect "/login"
    end
  end

  post '/domains/:id' do
    authenticate_user
      if params[:domain_name].empty? || params[:expiry_date].empty?
        redirect "/domains/#{params[:id]}/edit"
      else
        @domain = DomainName.find_by_id(params[:id])
        @domain.update(domain_name: params[:domain_name], expiry_date: params[:expiry_date], service_id: params[:service_id])
        @domain.save
        flash[:message] = "Your domain name was successfully updated!"
        redirect "/domains/#{@domain.id}"
      end
  end

  delete '/domains/:id/delete' do
    authenticate_user
    @domain = DomainName.find_by_id(params[:id])
    if @domain.user_id == session[:user_id]
      @domain.destroy
      flash[:message] = "Your domain name was deleted!"
      redirect '/domains'
    else
      redirect '/domains'
    end
  end
end