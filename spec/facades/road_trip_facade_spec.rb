require 'rails_helper'

RSpec.describe 'Road Trip Facade' do
  it 'can plan road trip with origin, destination, travel time & forecast', :vcr do
    origin = 'los angeles, ca'
    destination = 'new york, ny'

    results = RoadTripFacade.itinerary(origin, destination)

    expect(results.end_city).to eq(destination)
    expect(results.start_city).to eq(origin)
    expect(results.eta_weather.length).to eq(48)
    expect(results.travel_time).to be_an Integer
  end
end
