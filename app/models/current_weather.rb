class CurrentWeather
  attr_reader :time, :date, :conditions, :icon, :temperature, :high, :low

  def initialize(attributes = {})
    @time = DateTime.strptime(attributes[:currently][:time].to_s,'%s').in_time_zone(attributes[:timezone]).strftime("%I:%M%p")
    @date = DateTime.strptime(attributes[:currently][:time].to_s,'%s').in_time_zone(attributes[:timezone]).strftime("%m/%d")
    @conditions = attributes[:currently][:summary]
    @icon = attributes[:currently][:icon]
    @temperature = attributes[:currently][:temperature]
    @high = attributes[:daily][:data].first[:temperatureHigh]
    @low = attributes[:daily][:data].first[:temperatureLow]
  end
end
