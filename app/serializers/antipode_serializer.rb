class ForecastSerializer
  def initialize(location, array = [])
    @location = location
    @current_weather = array.first
    @details = array[1]
    @data = array.last
  end

  def json
  end
end
