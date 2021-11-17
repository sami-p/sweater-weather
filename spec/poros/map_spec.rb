require 'rails_helper'

RSpec.describe 'Map POROS' do
  it 'exists and has attributes', :vcr do
    info = {lat: 41.883229,
           lng: -87.632398}

    map = Map.new(info)

    expect(map).to be_a Map
    expect(map.latitude).to be_a Float
    expect(map.longitude).to be_a Float
  end
end
