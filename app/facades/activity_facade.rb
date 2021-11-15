class ActivityFacade
  def self.activity(type)
    activity = ActivityService.activity(type)
    Activity.new(activity)
  end
end
