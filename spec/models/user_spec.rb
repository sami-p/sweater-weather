require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_uniqueness_of(:api_key)}
  end

  describe "methods" do
    describe "#assign_api_key" do
      it 'generates and assigns and random api key for each user' do
        user = User.new({email: 'oopsididitagain@gmail.com',
                        password: 'britneyspears',
                        password_confirmation: 'britneyspears'})

        user.assign_api_key

        expect(user.api_key).to eq(user.api_key)
      end
    end
  end
end
