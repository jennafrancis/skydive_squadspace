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
      flash[:message] = "Successfully posted jump."
      redirect "/users/#{@user.slug}"
    else
      flash[:message] = "Jump was invalid. Please try again."
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
        flash[:message] = "You do not have permission to edit or delete this jump."
        redirect "/jumps/#{@jump.id}"
      end
    else
      redirect '/'
    end
  end

  post '/jumps/:id' do
    @jump = Jump.find(params[:id])
    @jump.update(kind: params[:kind], height: params[:height], comments: params[:comments])
    flash[:message] = "Successfully updated jump."
    redirect "/users/#{@jump.user.slug}"
  end

  delete '/jumps/:id' do
    @jump = Jump.find(params[:id])
    @user = @jump.user
    if is_logged_in? && current_user == @jump.user
      @jump.destroy
      flash[:message] = "Successfully deleted jump."
      redirect "/users/#{@user.slug}"
    else
      flash[:message] = "You do not have permission to edit or delete this jump."
      redirect "/jumps/#{@jump.id}"
    end
  end
end
