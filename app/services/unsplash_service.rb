class UnsplashService

  def self.background_photo(location)
    response = Faraday.get("https://api.unsplash.com/search/photos?client_id=#{ENV['unsplash_api']}&query=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
