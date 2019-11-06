class Api::V1::RoadtripController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:show]
  def show
    information = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(api_key: information[:api_key])
    if user
      @destination_information = DestinationInformationFacade.new(information[:origin], information[:destination]).find_information
      render json: DestinationSerializer.new(@destination_information).json
    else
      render json: UnauthorizedSerializer.new("You are not authorized to view this page").json
    end
  end
end
