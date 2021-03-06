class CoordinateFacade
  def initialize(location)
    @location = location
  end

  def get_coordinates
    obtain_and_format_coordinates
  end

  private

  def get_coordiantes_from_api(location)
    GoogleGeocodingService.new(location).coordinates
  end

  def obtain_and_format_coordinates
    Coordinate.new(get_coordiantes_from_api(@location))
  end
end
