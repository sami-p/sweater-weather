require 'rails_helper'

RSpec.describe 'Sessions Request' do
  it 'logs in a user with email and password confirmation' do
    user = User.create!({email: 'shessolucky@shesastar.com',
                         password: 'britneyspears',
                         password_confirmation: 'britneyspears',
                         api_key: 'alsidjfioashefoij84'
                       })

    body = {email: 'shessolucky@shesastar.com',
            password: 'britneyspears'}
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/sessions', headers: headers, params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(results[:attributes][:email]).to eq(user.email)
    expect(results[:attributes][:api_key]).to eq(user.api_key)
  end

  it 'renders an error if password is invalid' do
    user = User.create!({email: 'shessolucky@shesastar.com',
                         password: 'britneyspears',
                         password_confirmation: 'britneyspears',
                         api_key: 'alsidjfioashefoij84'
                       })

    body = {email: 'shessolucky@shesastar.com',
            password: 'britney'}
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/sessions', headers: headers, params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response.status).to eq(401)
  end

  it 'renders an error if email is invalid' do
    user = User.create!({email: 'shessolucky@shesastar.com',
                         password: 'britneyspears',
                         password_confirmation: 'britneyspears',
                         api_key: 'alsidjfioashefoij84'
                       })

    body = {email: 'britney@spears.com',
            password: 'britneyspears'}
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/sessions', headers: headers, params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response.status).to eq(401)
  end
end
