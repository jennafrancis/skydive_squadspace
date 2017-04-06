class JumpsController < ApplicationController

  get '/jumps' do
    @jumps = Jump.all
    erb :'jumps/index'
  end

  get '/jumps/new' do
    erb :'jumps/new'
  end

  post '/jumps' do

    # redirect to user profile
  end

  

end
