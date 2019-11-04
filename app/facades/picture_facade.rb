class PictureFacade
  def initialize(location)
    @location = location
  end

  def git_picture
    git_picture_for_city(@location)[:results].first[:geometry][:location]
  end

  def git_picture_for_city(location)
    GoogleGeocodingService.new(location).picture
  end
end
