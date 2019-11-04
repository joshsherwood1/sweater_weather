class InformationFacade
  def initialize(location)
    @location = location
  end

  def get_information
    @coordinates = CoordinateFacade.new(@location).get_coordinates
    @forecast_data =  get_forecast_data_for_antipode_of_coordiantes(@coordinates)
    @antipode_location = LocationFacade.new(@antipode_coordinates).get_location
    [@forecast_data, @antipode_location, @location]
  end

  def get_forecast_data_for_antipode_of_coordiantes(coordinates)
    @antipode_coordinates = AntipodeFacade.new(@coordinates).get_coordinates
    ForecastFacade.new(@antipode_coordinates).get_antipode_forecast
  end

end
