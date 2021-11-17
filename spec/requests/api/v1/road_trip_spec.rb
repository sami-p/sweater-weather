require 'rails_helper'

RSpec.describe 'Road Trip Api' do
  before :each do
    @user = User.create!({email: 'shessolucky@shesastar.com',
                         password: 'britneyspears',
                         password_confirmation: 'britneyspears',
                         api_key: 'alsidjfioashefoij84'
                       })
    @body = ({origin: 'chicago,il',
              destination: 'denver,co',
              api_key: 'asidhfkiasdjf7249as'})

    @headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
  end
  it 'can plan road trip with origin, destination, travel time and forecast' do
    post '/api/v1/road_trip', headers: @headers, params: @body, as: :json

    expect(response.status).to eq(200)

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    require "pry"; binding.pry
    expect(results).to be_a Hash
  end
end
