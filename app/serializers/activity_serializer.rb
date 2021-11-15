class ActivitySerializer

  def self.activity(forecast, location, activities)
    {
    data: {
      id: null,
      type: "activities",
      attributes: {
        destination: location,
        forecast: {
          summary: forecast.conditions,
          temperature: forecast.temperature
        },
        activities: [
            {title: activity.name,
            type: activity.type,
            participants: activity.participants,
            price: activity.price},
            {title: activity.name,
            type: activity.type,
            participants: activity.participants,
            price: activity.price
          }]
        }
      }
    }
  end
end
