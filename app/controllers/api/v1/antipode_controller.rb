class Api::V1::AntipodeController < ApplicationController
  def show
    @coordinates = CoordinateFacade.new(params[:location]).get_coordinates
    @antipode_coordinates = AntipodeFacade.new(@coordinates).get_coordinates
    @forecast_data = ForecastFacade.new(@antipode_coordinates).get_antipode_forecast
    @antipode_coordinates_location = LocationFacade.new(@antipode_coordinates).get_location
    render json: AntipodeSerializer.new(@forecast_data, @antipode_coordinates_location, params[:location]).json
  end
end
