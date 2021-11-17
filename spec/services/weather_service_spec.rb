require 'rails_helper'

RSpec.describe 'Weather Service' do
  describe 'Class Methods' do
    describe '#location ' do
      it 'returns successful response with valid params', :vcr do
        latitude = 39.738453
        longitude = -104.984853
        exclude = 'minutely,alerts'
        units = 'imperial'

        response = WeatherService.location(latitude, longitude)

        expect(response).to have_key(:current)
        expect(response).to have_key(:daily)
        expect(response).to have_key(:hourly)

        expect(response).to_not have_key(:minutely)
        expect(response).to_not have_key(:alerts)
      end

      it 'returns a 400 if bad data given', :vcr do
        latitude = "bad data"
        longitude = -104.984853
        exclude = 'minutely,alerts'
        units = 'imperial'

        response = WeatherService.location(latitude, longitude)

        expect(response[:cod]).to eq('400')
      end

      it 'returns a 400 if not enough data given', :vcr do
        longitude = nil
        latitude = 39.738453
        exclude = 'minutely,alerts'
        units = 'imperial'

        response = WeatherService.location(latitude, longitude)

        expect(response[:cod]).to eq('400')
      end
    end
  end
end
