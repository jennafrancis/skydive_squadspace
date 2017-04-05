class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  post '/login' do

    redirect '/'
  end

  get '/signup' do
    erb :'users/new'
  end

end
