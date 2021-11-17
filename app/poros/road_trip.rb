class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :eta_weather

  def initialize(from, to, directions, eta_weather)
    @start_city = from
    @end_city = to
    @travel_time = ((directions[:route][:legs][0][:time]) / 60) / 60
    @eta_weather = eta_weather
  end

  def destination_weather
    @eta_weather[@travel_time - 1]
  end
end
