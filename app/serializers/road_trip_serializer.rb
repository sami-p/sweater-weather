class RoadTripSerializer
  def self.road_trip(info)
      {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
        start_city: info.start_city,
          end_city: info.end_city,
          travel_time: info.travel_time,
          weather_at_eta: {
            temperature: info.destination_weather.temperature,
            conditions: info.destination_weather.conditions
          }
        }
      }
    }
  end
end
