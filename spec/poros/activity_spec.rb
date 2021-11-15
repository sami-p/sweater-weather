require 'rails_helper'

RSpec.describe 'Activity POROs' do
  it 'exists and has attributes' do
    activity = Activity.new({
                              activity: "Snowshoeing and birdwatching",
                              type: "Recreational",
                              participants: 1,
                              price: 0.0
                            })

    expect(activity).to be_an_instance_of(Activity)
    expect(activity.title).to eq("Snowshoeing and birdwatching")
    expect(activity.type).to eq("Recreational")
    expect(activity.participants).to eq(1)
    expect(activity.price).to eq(0.0)
  end
end
