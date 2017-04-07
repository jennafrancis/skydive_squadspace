class LocationsController < ApplicationController

  get '/locations' do
    if is_logged_in?
      @locations = Location.all
      erb :'locations/index'
    else
      redirect '/'
    end
  end

  get '/locations/:slug' do
    if is_logged_in?
      @location = Location.find_by_slug(params[:slug])
      erb :'locations/show'
    else
      redirect '/'
    end
  end
end
