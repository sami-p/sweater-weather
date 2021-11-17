require 'rails_helper'

RSpec.describe 'Current POROS' do
  it 'exists and has attributes' do
    latitude = 41.883229
    longitude = -87.632398
    location = WeatherService.location(latitude, longitude)
    forecast = Current.new(location[:current])

    expect(forecast).to be_a Current
    expect(forecast.date_time).to be_a String
    expect(forecast.sunrise).to be_a String
    expect(forecast.sunset).to be_a String
    expect(forecast.temperature).to be_a Float
    expect(forecast.feels_like).to be_a Float
    expect(forecast.humidity).to be_an Integer
    expect(forecast.uvi).to be_a Float
    expect(forecast.visibility).to be_an Integer
    expect(forecast.conditions).to be_a String
    expect(forecast.icon).to be_a String
  end
end
