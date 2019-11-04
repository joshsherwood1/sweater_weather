class Api::V1::BackgroundController < ApplicationController
  def show
    @picture = PictureFacade.new(params[:location]).get_picture
  #   @coordinates = CoordinateFacade.new(params[:location]).get_coordinates
  #   @forecast_data = ForecastFacade.new(@coordinates).get_forecast
  #   render json: ForecastSerializer.new(params[:location], @forecast_data).json
  end
end
