class MapService
  def self.get_data(url)
    Faraday.new(url)
  end
end
