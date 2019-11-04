class Details
  attr_reader :today_description, :tonight_description, :conditions, :icon, :feels_like, :humidity, :visibility, :uv_index

  def initialize(attributes = {})
    @today_description = attributes[:daily][:data].first[:summary]
    @tonight_description = find_12_forcast(attributes)[:summary]
    @conditions = attributes[:currently][:summary]
    @icon = attributes[:daily][:icon]
    @feels_like = attributes[:currently][:apparentTemperature]
    @humidity = attributes[:currently][:humidity]
    @visibility = attributes[:currently][:visibility]
    @uv_index = attributes[:currently][:uvIndex]
  end

  def find_12_forcast(data)
    data[:hourly][:data].find do |hash|
      DateTime.strptime(hash[:time].to_s,'%s').in_time_zone(data[:timezone]).strftime("%I:%M%p") == "12:00AM"
    end
  end
end
