require 'rails_helper'

RSpec.describe 'User' do
  it 'creates new user' do
    body = {email: 'oopsididitagain@gmail.com',
            password: 'britneyspears',
            password_confirmation: 'britneyspears'}
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/users', headers: headers, params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(response.status).to eq(201)

    expect(response).to have_key(:type)
    expect(response[:type]).to eq("users")
    expect(response).to have_key(:id)
    expect(response).to have_key(:attributes)
    expect(response[:attributes]).to have_key(:email)
    expect(response[:attributes]).to have_key(:api_key)
  end
end
