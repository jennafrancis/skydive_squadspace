class UsersController < ApplicationController

  get '/login' do
    if is_logged_in?
      redirect '/jumps'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/jumps'
    else
      #error message
      redirect '/login'
    end
  end

  get '/logout' do
    if is_logged_in?
      session.clear
    end
    redirect '/login'
  end

  get '/signup' do
    if is_logged_in?
      redirect '/jumps'
    else
      erb :'users/new'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect '/jumps'
    else
      #error message
      redirect '/signup'
    end
  end

  get '/users/:slug' do
    if is_logged_in?
      @user = User.find_by_slug(params[:slug])
      erb :'users/show'
    else
      redirect '/'
    end
  end

end
