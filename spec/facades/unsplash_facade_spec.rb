require 'rails_helper'

RSpec.describe "Unsplash Facade" do
  it 'can render a background image for given location', :vcr do
    location = 'chicago, il'

    results = UnsplashFacade.background(location)

    expect(results).to be_a Background
    expect(results.artist).to be_a String
    expect(results.artist_profile).to be_a String
    expect(results.photo).to be_a String
    expect(results.source).to be_a String
  end
end
