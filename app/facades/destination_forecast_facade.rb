class DestinationForecastFacade
  def initialize(latitude, longitude, hours_to_destination)
    @latitude = latitude
    @longitude = longitude
    @hours_to_destination = hours_to_destination
  end

  def get_predicted_forecast
    data = get_predicted_forecast_for_city(@latitude, @longitude)
    DestinationForecast.new(data, @hours_to_destination)
  end

  def get_predicted_forecast_for_city(latitude, longitude)
    DarkSkyService.new(latitude, longitude).forecast
  end
end
