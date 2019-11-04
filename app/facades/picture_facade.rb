class PictureFacade
  def initialize(location)
    @location = location
  end

  def get_picture
    get_picture_for_city(@location)[:urls][:raw]
  end

  def get_picture_for_city(location)
    UnsplashService.new(location).picture
  end
end
