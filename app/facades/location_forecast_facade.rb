class LocationForecastFacade
  def initialize(location)
    @location = location
  end

  def get_forecast
    @coordinates = CoordinateFacade.new(@location).get_coordinates
    ForecastFacade.new(@coordinates).get_forecast
  end
end
