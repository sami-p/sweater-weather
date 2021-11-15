class Activity
  attr_reader :title,
              :type,
              :participants,
              :price
              
  def initialize(info)
    @title = info[:title]
    @type = info[:type]
    @participants = info[:participants]
    @price = info[:price]
  end
end
