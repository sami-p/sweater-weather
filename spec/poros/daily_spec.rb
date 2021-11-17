require 'rails_helper'

RSpec.describe 'Daily POROS' do
  it 'exists and has attributes' do
    latitude = 41.883229
    longitude = -87.632398
    location = WeatherService.location(latitude, longitude)
    forecasts = location[:daily][0..4].map do |hash|
      Daily.new(hash)
    end

    expect(forecasts[0]).to be_a Daily
    expect(forecasts[0].date_time).to be_a String
    expect(forecasts[0].sunrise).to be_a String
    expect(forecasts[0].sunset).to be_a String
    expect(forecasts[0].max_temp).to be_a Float
    expect(forecasts[0].min_temp).to be_a Float
    expect(forecasts[0].conditions).to be_a String
    expect(forecasts[0].icon).to be_a String
  end
end
