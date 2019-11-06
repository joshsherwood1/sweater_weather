class DestinationForecastFacade
  def initialize(latitude, longitude, hours_to_destination)
    @latitude = latitude
    @longitude = longitude
    @hours_to_destination = hours_to_destination
  end

  def get_predicted_forecast
    obtain_and_format_predicted_forecast
  end

  private

  def get_predicted_forecast_from_api(latitude, longitude)
    DarkSkyService.new(latitude, longitude).forecast
  end

  def obtain_and_format_predicted_forecast
    data = get_predicted_forecast_from_api(@latitude, @longitude)
    DestinationForecast.new(data, @hours_to_destination)
  end
end
