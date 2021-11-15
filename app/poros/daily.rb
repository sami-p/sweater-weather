class Daily
  attr_reader :date_time,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(daily)
    @date_time = Time.at(daily[:dt]).strftime('%F')
    @sunrise = Time.at(daily[:sunrise]).strftime('%F %T %:z')
    @sunset = Time.at(daily[:sunset]).strftime('%F %T %:z')
    @max_temp = daily[:temp][:max]
    @min_temp = daily[:temp][:min]
    @conditions = daily[:weather][0][:description]
    @icon = daily[:weather][0][:icon]
  end
end
