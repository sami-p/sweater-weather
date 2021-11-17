require 'rails_helper'

RSpec.describe 'Road Trip Api' do
  it 'can plan road trip with origin, destination, travel time and forecast', :vcr do
    user = User.create!({email: 'shessolucky@shesastar.com',
                         password: 'britneyspears',
                         password_confirmation: 'britneyspears',
                         api_key: 'iVpu4bGGDYYDtP2mD5b0Rgtt'
                        })
    body = ({origin: 'los angeles,ca',
             destination: 'new york,ny',
             api_key: user.api_key})

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
    post '/api/v1/road_trip', headers: headers, params: body, as: :json

    expect(response.status).to eq(200)

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(results).to be_a Hash
  end

  it 'renders error if api key is invalid or does not exist' do
    user = User.create!({email: 'shessolucky@shesastar.com',
                         password: 'britneyspears',
                         password_confirmation: 'britneyspears'
                        })
    body = ({origin: 'los angeles,ca',
             destination: 'new york,ny'})

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
    post '/api/v1/road_trip', headers: headers, params: body, as: :json

    expect(response.status).to eq(401)
  end
end
