require 'rails_helper'

RSpec.describe 'Weather Facade' do
  it 'gets all weather for longitude & latitude', :vcr do
    latitude = 41.883229
    longitude = -87.632398

    results = WeatherFacade.all_weather(latitude, longitude)

    expect(results).to be_instance_of Forecast

    expect(results.current.conditions).to be_a String
    expect(results.current.temperature).to be_a Float
    expect(results.current.feels_like).to be_a Float
    expect(results.current.sunrise).to be_a String
    expect(results.current.sunset).to be_a String
    expect(results.current.date_time).to be_a String
    expect(results.current.icon).to be_a String

    expect(results.daily.length).to eq(5)
    expect(results.daily[0].conditions).to be_a String
    expect(results.daily[0].min_temp).to be_a Float
    expect(results.daily[0].max_temp).to be_a Float
    expect(results.daily[0].sunrise).to be_a String
    expect(results.daily[0].sunset).to be_a String

    expect(results.hourly.length).to eq(8)
    expect(results.hourly[0].conditions).to be_a String
    expect(results.hourly[0].temperature).to be_a Float
    expect(results.hourly[0].date_time).to be_a String
    expect(results.hourly[0].icon).to be_a String
  end

  it 'gets current weather for latitude & longitude', :vcr do
    latitude = 41.883229
    longitude = -87.632398

    results = WeatherFacade.current_weather(latitude, longitude)

    expect(results.conditions).to be_a String
    expect(results.temperature).to be_a Float
    expect(results.feels_like).to be_a Float
    expect(results.sunrise).to be_a String
    expect(results.sunset).to be_a String
    expect(results.date_time).to be_a String
    expect(results.icon).to be_a String
  end

  it 'gets daily weather for latitude & longitude', :vcr do
    latitude = 41.883229
    longitude = -87.632398

    results = WeatherFacade.daily_weather(latitude, longitude)

    expect(results.length).to eq(5)
    expect(results[0].conditions).to be_a String
    expect(results[0].min_temp).to be_a Float
    expect(results[0].max_temp).to be_a Float
    expect(results[0].sunrise).to be_a String
    expect(results[0].sunset).to be_a String
  end

  it 'gets hourly weather for latitude & longitude', :vcr do
    latitude = 41.883229
    longitude = -87.632398

    results = WeatherFacade.hourly_weather(latitude, longitude)

    expect(results.length).to eq(8)
    expect(results[0].conditions).to be_a String
    expect(results[0].temperature).to be_a Float
    expect(results[0].date_time).to be_a String
    expect(results[0].icon).to be_a String
  end

  it 'gets all hourly weather for latitude & longitude', :vcr do
    latitude = 41.883229
    longitude = -87.632398

    results = WeatherFacade.all_hourly(latitude, longitude)

    expect(results.length).to eq(48)
    expect(results[0].conditions).to be_a String
    expect(results[0].temperature).to be_a Float
    expect(results[0].date_time).to be_a String
    expect(results[0].icon).to be_a String
  end
end
