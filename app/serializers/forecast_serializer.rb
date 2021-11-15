class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id {nil}
  attributes :current, :daily, :hourly
end
