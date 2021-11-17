class MapService
  def self.get_data(url)
    Faraday.new(url)
  end

  def self.location(location)
    response = get_data("https://www.mapquestapi.com/geocoding/v1/address").get do |f|
      f.params['key'] = ENV['maps_api']
      f.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.directions(from, to)
    response = get_data("http://open.mapquestapi.com/directions/v2/route?key=#{ENV['maps_api'}&from=#{from}&to=#{to}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
