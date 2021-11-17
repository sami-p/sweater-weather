require 'rails_helper'

RSpec.describe 'Road Trip POROS' do
  it 'exists and has attributes', :vcr do
    from = 'los angeles, ca'
    to = 'new york, ny'
    itinerary = RoadTripFacade.itinerary(from, to)
    directions = MapService.directions(from, to)
    eta_weather = RoadTripFacade.itinerary(from, to).eta_weather

    trip = RoadTrip.new(from, to, directions, eta_weather)

    expect(trip).to be_a RoadTrip
    expect(trip.start_city).to eq(from)
    expect(trip.end_city).to eq(to)
    expect(trip.travel_time).to eq(41)
    expect(trip.eta_weather.length).to eq(48)
  end

  it '#destination_weather', :vcr do
    from = 'chicago, il'
    to = 'denver, co'
    directions = MapService.directions(from, to)
    eta_weather = RoadTripFacade.itinerary(from, to).eta_weather

    trip = RoadTrip.new(from, to, directions, eta_weather)
    weather = trip.destination_weather

    expect(weather).to be_an Hourly
    expect(weather.conditions).to be_a String
    expect(weather.date_time).to be_a String
    expect(weather.icon).to be_a String
    expect(weather.temperature).to be_a Float
  end
end
