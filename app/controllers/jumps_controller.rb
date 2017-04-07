class JumpsController < ApplicationController

  get '/jumps' do
    if is_logged_in?
      @jumps = Jump.all
      erb :'jumps/index'
    else
      redirect '/'
    end
  end

  get '/jumps/new' do
    if is_logged_in?
      @locations = Location.all
      erb :'jumps/new'
    else
      redirect '/'
    end
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
    if is_logged_in?
      @jump = Jump.find(params[:id])
      erb :'jumps/show'
    else
      redirect '/'
    end
  end

  get '/jumps/:id/edit' do
    @jump = Jump.find(params[:id])
    if is_logged_in?
      if current_user == @jump.user
        erb :'jumps/edit'
      else
        # error message - you do not have permission to edit this jump
        redirect "/jumps/#{@jump.id}"
      end
    else
      redirect '/'
    end
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
    redirect "/jumps/#{@jump.id}"
  end
end
