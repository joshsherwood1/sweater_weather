class InformationFacade
  def initialize(location)
    @location = location
  end

  def get_information
    coordinates = obtain_coordinates(@location)
    antipode_coordinates = obtain_antipode_coordinates(coordinates)
    forecast_data =  get_forecast_data_for_antipode_of_coordiantes(antipode_coordinates)
    antipode_location = obtain_location(antipode_coordinates)
    [forecast_data, antipode_location, @location]
  end

  private
  attr_reader :location
  
  def get_forecast_data_for_antipode_of_coordiantes(antipode_coordinates)
    ForecastFacade.new(antipode_coordinates).get_antipode_forecast
  end

  def obtain_antipode_coordinates(coordinates)
    AntipodeFacade.new(coordinates).get_coordinates
  end

  def obtain_coordinates(location)
    CoordinateFacade.new(@location).get_coordinates
  end

  def obtain_location(antipode_coordinates)
    LocationFacade.new(antipode_coordinates).get_location
  end
end
