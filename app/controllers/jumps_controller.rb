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

  get '/jumps/:id' do
    @jump = Jump.find(params[:id])
    erb :'jumps/show'
  end

  get '/jumps/:id/edit' do

    erb :'jumps/edit'
  end

  delete '/jumps/:id' do
  @jump = Jump.find(params[:id])
  if is_logged_in? && current_user == @jump.user
    @jump.destroy
  end
  #error message
  redirect '/jumps'
end


end
