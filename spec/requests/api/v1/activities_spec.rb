require 'rails_helper'

RSpec.describe 'Activities Endpoint' do
  describe 'GET /activites' do
    it 'returns activities for a given location based on weather', :vcr do
      destination = "chicago,il"
      get "/api/v1/activities?destination=#{destination}"

      expect(response.status).to eq(200)
      expect(response).to be_successful

      results = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(results).to be_a Hash
      expect(results[:type]).to eq("activities")
      expect(results).to have_key(:attributes)
      expect(results[:attributes][:destination]).to eq(destination)
      expect(results[:attributes][:forecast][:temperature]).to be < 50
      expect(results[:attributes][:activities].length).to eq(2)
      expect(results[:attributes][:activities].first).to have_key(:title)
      expect(results[:attributes][:activities].first).to have_key(:type)
      expect(results[:attributes][:activities].first).to have_key(:participants)
      expect(results[:attributes][:activities].first).to have_key(:price)
      expect(results[:attributes][:activities].first[:type]).to eq("relaxation")
      expect(results[:attributes][:activities].last[:type]).to eq("cooking")
    end
  end
end
