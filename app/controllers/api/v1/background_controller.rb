class Api::V1::BackgroundController < ApplicationController
  def show
    @picture_url = PictureFacade.new(params[:location]).get_picture
    render json: PictureSerializer.new(@picture_url).json
  end
end
