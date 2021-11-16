class UnsplashSerializer

  def self.photo_info(info)
    {
      data: {
        type: "image",
        id: nil,
        attributes: {
          image: {
            location: info.location,
            image_url: info.photo,
            credit: {
              source: info.source,
              artist: info.artist,
              artist_profile: info.artist_profile,
            }
          }
        }
      }
    }
  end
end
