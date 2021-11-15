require 'rails_helper'

RSpec.describe 'Forecast Api' do
  describe 'get /forecast' do
    it 'can get the forecast for a given location', :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response.status).to eq(200)

      results = JSON.parse(response.body, symbolize_names: true)[:data]
      require "pry"; binding.pry
      expect(results).to be_a Hash
    end
  end
end
