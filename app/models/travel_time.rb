class TravelTime
  attr_reader :time, :seconds, :rounded_hour, :latitude, :longitude
  def initialize(data)
    @time = data[:routes].first[:legs].first[:duration][:text]
    @seconds = data[:routes].first[:legs].first[:duration][:value]
    @rounded_hour = make_rounded_down_hour(@seconds)
    @latitude = data[:routes].first[:legs].first[:end_location][:lat]
    @longitude = data[:routes].first[:legs].first[:end_location][:lng]
  end

  private

  def make_rounded_down_hour(seconds)
    (seconds / 3600)
  end
end
