class JumpsController < ApplicationController

  get '/jumps' do
    @jumps = Jump.all
    erb :'jumps/index'
  end

  get '/jumps/new' do
    @locations = Location.all
    erb :'jumps/new'
  end

  post '/jumps' do
    @user = User.find(session[:user_id])
    @jump = @user.jumps.build(params[:jump])
    if params[:jump][:location_id] == nil
      location = Location.create(params[:location])
      @jump.location_id = location.id
    end
    if @jump.valid?
      @jump.save
      redirect "/users/#{@user.slug}"
    else
      # error message
      redirect '/jumps/new'
    end
  end

  get '/jumps/:id' do
    @jump = Jump.find(params[:id])
    erb :'jumps/show'
  end

  get '/jumps/:id/edit' do
    #only if the jump belongs to the user currently signed in
    @jump = Jump.find(params[:id])
    erb :'jumps/edit'
    #otherwise show error message and redirect back to homepage '/jumps'
  end

  post '/jumps/:id' do
    @jump = Jump.find(params[:id])
    @jump.update(kind: params[:kind], height: params[:height], comments: params[:comments])
    redirect "/jumps/<%= @jump.id %>"
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
