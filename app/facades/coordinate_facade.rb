class CoordinateFacade
  def initialize(location)
    @location = location
  end

  def get_coordinates
    get_coordiantes_for_city(@location)[:results].first[:geometry][:location]
  end

  def get_coordiantes_for_city(location)
    GoogleGeocodingService.new(location).coordinates
  end
end
