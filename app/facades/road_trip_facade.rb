class RoadTripFacade
  def self.itinerary(from, to)
    location = MapFacade.location(to)
    directions = MapService.directions(from, to)
    eta_weather = WeatherFacade.all_hourly(location.latitude, location.longitude)
    RoadTrip.new(from, to, directions, eta_weather)
  end
end
