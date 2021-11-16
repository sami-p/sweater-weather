class UnsplashSerializer
  include FastJsonapi::ObjectSerializer

  def self.photo_info(info)
    {
      data: {
        type: "image",
        id: nil,
        attributes: {
          image: {
            location: info.description,
            image_url: info.photo,
            credit: {
              source: info.source,
              author: info.artist_name,
              author_profile: info.artist_profile,
            }
          }
        }
      }
    }
  end
end
