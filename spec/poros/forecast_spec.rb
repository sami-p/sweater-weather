require 'rails_helper'

RSpec.describe 'Forecast POROS' do
  it 'exists and has attributes' do
    latitude = 41.883229
    longitude = -87.632398
    location = WeatherService.location(latitude, longitude)

    all_weather = WeatherFacade.all_weather(latitude, longitude)

    current = WeatherFacade.current_weather(latitude, longitude)
    daily = WeatherFacade.daily_weather(latitude, longitude)
    hourly = WeatherFacade.hourly_weather(latitude, longitude)

    forecast = Forecast.new(current, daily, hourly)

    expect(forecast).to be_a Forecast
    expect(forecast.current.conditions).to be_a String
    expect(forecast.daily.first.conditions).to be_a String
    expect(forecast.hourly.first.conditions).to be_a String
  end
end
