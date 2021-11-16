require 'rails_helper'

RSpec.describe 'Api Key Generator' do
  it 'can create random api key' do
    key = ApiKey.generate
    key_2 = ApiKey.generate
    
    expect(key).to be_a String
    expect(key_2).to_not eq(key)
  end
end
