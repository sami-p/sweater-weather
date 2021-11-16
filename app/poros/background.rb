class Background
  attr_reader :location,
              :photo,
              :source,
              :artist,
              :artist_profile

  def initialize(info)
    @location = info[:description]
    @photo = info[:urls][:full]
    @source = info[:links][:self]
    @artist = info[:user][:name]
    @artist_profile = info[:user][:links][:self]
  end
end
