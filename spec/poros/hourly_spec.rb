require 'rails_helper'

RSpec.describe 'Hourly POROS' do
  it 'exists and has attributes' do
    latitude = 41.883229
    longitude = -87.632398
    location = WeatherService.location(latitude, longitude)
    forecasts = location[:hourly].map do |hash|
      Hourly.new(hash)
    end

    expect(forecasts[0]).to be_an Hourly
    expect(forecasts[0].date_time).to be_a String
    expect(forecasts[0].temperature).to be_a Float
    expect(forecasts[0].conditions).to be_a String
    expect(forecasts[0].icon).to be_a String
  end
end
