require 'rails_helper'

RSpec.describe "Background API" do
  it 'can render a background image for given location', :vcr do
    get '/api/v1/backgrounds?location=chicago,il'

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(results).to be_a Hash
    expect(results).to have_key(:type)
    expect(results[:attributes][:image]).to have_key(:location)
    expect(results[:attributes][:image]).to have_key(:image_url)
    expect(results[:attributes][:image][:credit]).to have_key(:source)
    expect(results[:attributes][:image][:credit]).to have_key(:artist)
    expect(results[:attributes][:image][:credit]).to have_key(:artist_profile)
  end
  
  it 'renders error if location is not included' do
    get '/api/v1/backgrounds'

    expect(response.status).to eq(400)
  end
end
