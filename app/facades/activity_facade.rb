class ActivityFacade
  def self.activity(type)
    activity = ActivityService.activity(type)
    Activity.new(activity)
  end

  def self.relaxation
    activity = ActivityService.activity("relaxation")
    Activity.new(activity)
  end
end
