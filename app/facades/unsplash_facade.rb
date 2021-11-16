class UnsplashFacade
  def self.background(location)
    service = UnsplashService.background(location)

    Background.new(service[:results][0])
  end
end
