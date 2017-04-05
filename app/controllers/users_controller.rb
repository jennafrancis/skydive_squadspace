class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/'
    else
      #error message
      redirect '/login'
    end
  end

  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do

    redirect '/'
  end

end
