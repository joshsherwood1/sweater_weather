class DestinationInformationFacade

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def find_information
    @travel_information = TravelTimeFacade.new(@origin, @destination).get_travel_time
    @forecast_data = DestinationForecastFacade.new(@travel_information.latitude, @travel_information.longitude, @travel_information.rounded_hour).get_predicted_forecast
    Destination.new(@travel_information, @forecast_data)
  end
end
