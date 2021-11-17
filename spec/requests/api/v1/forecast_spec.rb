require 'rails_helper'

RSpec.describe 'Forecast Api' do
  describe 'get /forecast' do
    it 'can get the forecast for a given location', :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response.status).to eq(200)

      results = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(results).to be_a Hash
      expect(results[:type]).to eq('forecast')
      expect(results).to have_key(:attributes)
      expect(results[:attributes]).to have_key(:current)
      expect(results[:attributes]).to have_key(:daily)
      expect(results[:attributes]).to have_key(:hourly)
      expect(results[:attributes]).to_not have_key(:minutely_weather)
      expect(results[:attributes]).to_not have_key(:alerts)

      current = results[:attributes][:current]
      expect(current[:date_time]).to be_a String
      expect(current[:sunrise]).to be_a String
      expect(current[:sunset]).to be_a String
      expect(current).to have_key(:temperature)
      expect(current).to have_key(:feels_like)
      expect(current[:humidity]).to be_an Integer
      expect(current[:uvi]).to be_a Float
      expect(current[:visibility]).to be_an Integer
      expect(current[:conditions]).to be_a String
      expect(current[:icon]).to be_a String
      expect(current).to_not have_key(:pressure)
      expect(current).to_not have_key(:dew_point)

      daily = results[:attributes][:daily].first
      expect(daily[:date_time]).to be_a String
      expect(daily[:sunrise]).to be_a String
      expect(daily[:sunset]).to be_a String
      expect(daily).to have_key(:max_temp)
      expect(daily).to have_key(:min_temp)
      expect(daily[:conditions]).to be_a String
      expect(daily[:icon]).to be_a String
      expect(results[:attributes][:daily].length).to eq(5)
      expect(daily).to_not have_key(:wind_speed)
      expect(daily).to_not have_key(:moon_rise)

      hourly = results[:attributes][:hourly].first
      expect(hourly[:date_time]).to be_a String
      expect(hourly).to have_key(:temperature)
      expect(hourly[:conditions]).to be_a String
      expect(hourly[:icon]).to be_a String
      expect(results[:attributes][:hourly].length).to eq(8)
      expect(hourly).to_not have_key(:humidity)
      expect(hourly).to_not have_key(:pressure)
    end
  end

  # describe 'Invalid Location' do
  #   it 'renders an error if location is invalid' do
  #     get '/api/v1/forecast?location=$$$'
  #
  #     expect(response.status).to eq(400)
  #   end
  # end
end
