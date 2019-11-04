class InformationFacade
  def initialize(location)
    @location = location
  end

  def get_information
    @coordinates = CoordinateFacade.new(@location).get_coordinates
    @antipode_coordinates = AntipodeFacade.new(@coordinates).get_coordinates
    @forecast_data = ForecastFacade.new(@antipode_coordinates).get_antipode_forecast
    @antipode_coordinates_location = LocationFacade.new(@antipode_coordinates).get_location
    [@forecast_data, @antipode_coordinates_location, @location]
  end

end
