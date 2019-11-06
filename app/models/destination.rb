class Destination
  attr_reader :temperature, :summary, :travel_time

  def initialize(travel_info, forecast_info)
    @temperature = forecast_info.temperature
    @summary = forecast_info.summary
    @travel_time = travel_info.time
  end
end
