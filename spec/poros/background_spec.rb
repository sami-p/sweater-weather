require 'rails_helper'

RSpec.describe 'Background POROS' do
  it 'exists and has attributes', :vcr do
    info = {
            description: "City architecture and skyscrapers near waterfront",
            urls: {

                "full": "https://images.unsplash.com/photo"
            },
            links: {
                "self": "https://api.unsplash.com/photos/Nyvq2juw4_o"
            },
            user: {
                name: "Pedro Lastra",
                links: {
                    "self": "https://api.unsplash.com/users/peterlastra"
                }
            }
          }
    background = Background.new(info)
    expect(background).to be_a Background
    expect(background.location).to be_a String
    expect(background.photo).to be_a String
    expect(background.source).to be_a String
    expect(background.artist).to be_a String
    expect(background.artist_profile).to be_a String
  end
end
