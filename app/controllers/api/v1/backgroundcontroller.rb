class Api::V1::BackgroundController < ApplicationController
  def index
   if params[:location]
      background = UnsplashFacade.background(params[:location])
      render json: UnsplashSerializer.photo_info(background)
    else
      render :json => { :errors => 'Invalid Location' }, :status => 400
    end
  end
end
