require 'rails_helper'

RSpec.describe 'Activity Facade', :vcr do
  it 'can find activities based on type params' do
    cooking = ActivityFacade.activity("cooking")
    relaxation = ActivityFacade.activity("relaxation")
    recreational = ActivityFacade.activity("recreational")
    busywork = ActivityFacade.activity("busywork")

    expect(cooking).to be_an Activity
    expect(cooking.type).to eq("cooking")

    expect(relaxation).to be_an Activity
    expect(relaxation.type).to eq("relaxation")

    expect(recreational).to be_an Activity
    expect(recreational.type).to eq("recreational")

    expect(busywork).to be_an Activity
    expect(busywork.type).to eq("busywork")
  end
end
