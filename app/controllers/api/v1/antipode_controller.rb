class Api::V1::AntipodeController < ApplicationController
  def show
    @coordinates = CoordinateFacade.new(params[:location]).get_coordinates
    @antipode_coordinates = AntipodeFacade.new(@coordinates).get_coordinates
    @forecast_data = ForecastFacade.new(@antipode_coordinates).get_forecast
    # render json: ForecastSerializer.new(params[:location], @forecast_data).json
  end
end
