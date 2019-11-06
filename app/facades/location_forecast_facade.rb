class LocationForecastFacade
  def initialize(location)
    @location = location
  end

  def get_forecast
    obtain_and_format_forecast_for_location
  end

  private

  def obtain_and_format_forecast_for_location
    @coordinates = CoordinateFacade.new(@location).get_coordinates
    ForecastFacade.new(@coordinates).get_forecast
  end
end
