require 'rails_helper'

RSpec.describe 'Activity API' do
  describe 'get /activites' do
    it 'can get activities for a given location and weather type' do
      get '/api/v1/forecast?location=chicago,il'

      expect(response.status).to eq(200)

      results = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(results).to be_a Hash
    end
  end
end
