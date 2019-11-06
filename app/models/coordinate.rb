class Coordinate

  attr_reader :lat, :lng

  def initialize(attributes = {})
    @lat = attributes[:results].first[:geometry][:location][:lat]
    @lng = attributes[:results].first[:geometry][:location][:lng]
  end
end
