class ActivitySerializer

  def self.activity(relaxation, activity, destination, weather)
    {
    data: {
      id: nil,
      type: "activities",
      attributes: {
        destination: destination,
        forecast: {
          summary: weather.conditions,
          temperature: weather.temperature
        },
        activities: [
            {title: relaxation.title,
            type: relaxation.type,
            participants: relaxation.participants,
            price: relaxation.price},
            {title: activity.title,
            type: activity.type,
            participants: activity.participants,
            price: activity.price
          }]
        }
      }
    }
  end
end
