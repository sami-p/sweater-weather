class WeatherService
  def self.get_data(url)
    Faraday.new(url)
  end

  def self.location(latitude, longitude)
    response = get_data("https://api.openweathermap.org/data/2.5/onecall").get do |f|
      f.params['appid'] = ENV['weather_api']
      f.params['lat'] = latitude
      f.params['lon'] = longitude
      f.params['exclude'] = 'minutely,alerts'
      f.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
