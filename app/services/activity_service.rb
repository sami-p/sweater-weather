class ActivityService
  def self.get_data(url)
    Faraday.new(url)
  end

  def self.activity(type)
    response = get_data("http://www.boredapi.com/api/activity?type=#{type}").get
    JSON.parse(response.body, symbolize_names: true)
  end
end
