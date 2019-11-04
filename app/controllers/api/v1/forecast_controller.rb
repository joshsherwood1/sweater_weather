class Api::V1::ForecastController < ApplicationController
  def show
    @coordinates = CoordinateFacade.new(params[:location]).get_coordinates
    @forecast_data = ForecastFacade.new(@coordinates).get_forecast
    render json: ForecastSerializer.new(params[:location], @forecast_data).json
  end
end
