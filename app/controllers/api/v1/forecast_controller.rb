class Api::V1::ForecastController < ApplicationController
  def show
    @forecast_data = LocationForecastFacade.new(params[:location]).get_forecast
    render json: ForecastSerializer.new(params[:location], @forecast_data).json
  end
end
