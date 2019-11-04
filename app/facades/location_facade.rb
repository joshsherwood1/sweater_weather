class LocationFacade
  def initialize(antipode_coordinates)
    @antipode_coordinates = antipode_coordinates
  end

  def get_location
    @location = get_location_for_city(@antipode_coordinates)[:plus_code][:compound_code]
    @location.split(" ").drop(1).join(' ')
  end

  def get_location_for_city(location)
    GoogleGeocodingService.new(location).location
  end
end
