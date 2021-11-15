class MapFacade
  def self.location(location_params)
    lat_lon = MapService.location(location_params)[:results][0][:locations][0][:latLng]
    Map.new(lat_lon)
  end
end
