class Hourly
  attr_reader :date_time,
              :temperature,
              :conditions,
              :icon

  def initialize(hourly)
    @date_time = Time.at(hourly[:dt]).strftime('%T')
    @temperature = hourly[:temp]
    @conditions = hourly[:weather][0][:description]
    @icon = hourly[:weather][0][:icon]
  end
end
