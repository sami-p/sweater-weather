require 'rails_helper'

RSpec.describe 'Map Facade' do
  it 'provides latitude and longitude coordinates for location' do
    location = 'chicago, il'

    results = MapFacade.location(location)

    expect(results).to be_a Map
    expect(results.latitude).to be_a Float
    expect(results.longitude).to be_a Float
  end
end
