class Api::V1::RoadtripController < ApplicationController
  def show
    information = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(api_key: information[:api_key])
    if user
      @travel_information = TravelTimeFacade.new(information[:origin], information[:destination]).get_travel_time
      @forecast_data = DestinationForecastFacade.new(@travel_information.latitude, @travel_information.longitude, @travel_information.rounded_hour).get_predicted_forecast
      @destination_information = Destination.new(@travel_information, @forecast_data)
      render json: DestinationSerializer.new(@destination_information).json
    else
      render json: UnauthorizedSerializer.new("You are not authorized to view this page").json
    end
  end
end
