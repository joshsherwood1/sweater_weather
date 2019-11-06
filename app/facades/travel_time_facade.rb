class TravelTimeFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_travel_time
    TravelTime.new(get_total_travel_time(@origin, @destination))
  end

  def get_total_travel_time(origin, destination)
    GoogleMapService.new(origin, destination).travel_time
  end
end
