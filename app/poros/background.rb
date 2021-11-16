class Background
  attr_reader :description,
              :photo,
              :source,
              :photographer_name,
              :photographer_profile

  def initialize(info)
    @description = info[:description]
    @photo = info[:urls][:full]
    @source = info[:links][:self]
    @artist_name = info[:user][:name]
    @artist_profile = info[:user][:links][:photos]
  end
end
