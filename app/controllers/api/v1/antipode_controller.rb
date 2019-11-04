class Api::V1::AntipodeController < ApplicationController
  def show
    @information = InformationFacade.new(params[:location]).get_information
    render json: AntipodeSerializer.new(@information).json
  end
end
