class Api::V1::ActivitiesController < ApplicationController
  def index
    destination = MapFacade.location(params[:destination])
    weather = WeatherFacade.current_weather(destination.latitude, destination.longitude)
    relaxation = ActivityFacade.relaxation
    if weather.temperature >= 60
      activity = ActivityFacade.activity("recreational")
    elsif weather.temperature >= 50 && weather.temperature < 60
      activity = ActivityFacade.activity("busywork")
    elsif weather.temperature < 50
      activity = ActivityFacade.activity("cooking")
    else
      
    end
    render json: ActivitySerializer.activity(relaxation, activity, params[:destination], weather)
  end
end
