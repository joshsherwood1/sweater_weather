class AntipodeFacade
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def get_coordinates
    get_antipode_coordinates(@coordinates)
  end
  
  def get_antipode_coordinates(coordinates)
    AntipodeService.new(coordinates).coordinates
  end
end
