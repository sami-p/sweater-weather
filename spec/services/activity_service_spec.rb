require 'rails_helper'

RSpec.describe 'Activity Service', :vcr do
  it 'finds activities based on type params' do
    response = ActivityService.activity("recreational")

    expect(response).to be_a(Hash)
    
    expect(response).to have_key(:activity)
    expect(response[:activity]).to be_a String

    expect(response).to have_key(:type)
    expect(response[:type]).to eq("recreational")

    expect(response).to have_key(:participants)
    expect(response[:participants]).to be_an Integer

    expect(response).to have_key(:price)
    expect(response[:price]).to be_a Float
  end
end
