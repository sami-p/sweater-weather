class Api::V1::ForecastController < ApplicationController
  def index
    location = MapFacade.location(params[:location])
    weather = WeatherFacade.all_weather(location.latitude, location.longitude)
    if params[:location]
      render json: ForecastSerializer.new(weather)
    else
      render :json => { :errors => 'Invalid Location' }, :status => 400
    end
  end
end
