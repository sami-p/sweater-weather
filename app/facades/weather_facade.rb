class WeatherFacade

  def self.all_weather(latitude, longitude)
    location = WeatherService.location(latitude, longitude)
    Forecast.new(current_weather(latitude, longitude),
                 daily_weather(latitude, longitude),
                 hourly_weather(latitude, longitude))
  end

  def self.current_weather(latitude, longitude)
    location = WeatherService.location(latitude, longitude)
    Current.new(location[:current])
  end

  def self.daily_weather(latitude, longitude)
    location = WeatherService.location(latitude, longitude)
    location[:daily][0..4].map do |hash|
      Daily.new(hash)
    end
  end

  def self.hourly_weather(latitude, longtitude)
    location = WeatherService.location(latitude, longtitude)
    location[:hourly][0..7].map do |hash|
      Hourly.new(hash)
    end
  end

  def self.all_hourly(latitude, longitude)
    location = WeatherService.location(latitude, longitude)
    location[:hourly].map do |hash|
      Hourly.new(hash)
    end
  end
end
