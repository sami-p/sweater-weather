class SessionsSerializer

  def self.session(info)
        {
      data: {
        type: "users",
        id: info.id,
        attributes: {
          email: info.email,
          api_key: info.api_key
        }
      }
    }
  end
end
