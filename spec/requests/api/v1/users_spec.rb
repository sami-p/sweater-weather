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
    expect(results[:type]).to eq("users")
    expect(results).to have_key(:id)
    expect(results).to have_key(:attributes)
    expect(results[:attributes]).to have_key(:email)
    expect(results[:attributes]).to have_key(:api_key)
  end

  it 'renders error if password confirmation does not pass' do
    body = {email: 'oopsididitagain@gmail.com',
            password: 'britneyspears',
            password_confirmation: 'itsbritney'}
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/users', headers: headers, params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response.status).to eq(409)
  end

  it 'renders error if a field is empty' do
    body = {password: 'britneyspears',
            password_confirmation: 'britneyspears'}
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/users', headers: headers, params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response.status).to eq(409)
  end

  it 'renders error if email is already taken' do

    taken_body = {email: 'oopsididitagain@gmail.com',
                  password: 'britneyspears',
                  password_confirmation: 'britneyspears'}
    taken_headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/users', headers: taken_headers, params: taken_body, as: :json

    body = {email: 'oopsididitagain@gmail.com',
            password: 'britneyspears',
            password_confirmation: 'britneyspears'}
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/users', headers: headers, params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response.status).to eq(409)
  end
end
