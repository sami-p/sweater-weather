require 'rails_helper'

RSpec.describe 'Map Service' do
  describe 'Class Methods' do
    describe '#location' do
      it 'gets latitude and longitude response with given location', :vcr do
        location = 'chicago,il'

        response = MapService.location(location)
        expected = {"lat": 41.883229,
                    "lng": -87.632398}

        expect(response[:info][:statuscode]).to eq(0)
        expect(response[:results].first[:locations].first[:latLng]).to eq(expected)
      end
    end

    describe '#directions' do
      it 'gets directions response with given origin and destination', :vcr do
        origin = 'chicago,il'
        destination = 'new york, ny'
        response = MapService.directions(origin, destination)

        expect(response).to be_a Hash
        expect(response[:route]).to be_a Hash
        expect(response[:route][:legs][0]).to have_key(:time)
      end
    end
  end
end
