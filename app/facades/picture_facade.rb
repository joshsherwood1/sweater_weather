class PictureFacade
  def initialize(location)
    @location = location
  end

  def get_picture
    obtain_and_format_picture
  end

  private

  def get_picture_from_api(location)
    UnsplashService.new(location).picture
  end

  def obtain_and_format_picture
    Picture.new(get_picture_from_api(@location)).url
  end
end
