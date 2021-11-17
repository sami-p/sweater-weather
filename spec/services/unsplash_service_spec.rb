require 'rails_helper'

RSpec.describe 'Unsplash Service' do
  describe 'Class Methods' do
    describe '#background_photo' do
      it 'returns response with background photo of location', :vcr do
        location = 'chicago,il'

        response = UnsplashService.background_photo(location)

        expect(response).to be_a Hash
        expect(response[:results]).to be_an Array
        expect(response[:results][0]).to have_key(:urls)
      end
    end
  end
end
