class Current
  attr_reader :date_time,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(current)
    @date_time = Time.at(current[:dt]).strftime('%F %T %:z')
    @sunrise = Time.at(current[:sunrise]).strftime('%F %T %:z')
    @sunset = Time.at(current[:sunset]).strftime('%F %T %:z')
    @temperature = current[:temp]
    @feels_like = current[:feels_like]
    @humidity = current[:humidity]
    @uvi = current[:uvi]
    @visibility = current[:visibility]
    @conditions = current[:weather][0][:description]
    @icon = current[:weather][0][:icon]
  end
end
