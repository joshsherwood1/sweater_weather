class ForecastFacade
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def get_forecast
    data = get_forecast_for_city(@coordinates[:lat], @coordinates[:lng])
    [CurrentWeather.new(data), Details.new(data), DailyForecast.new(data), HourlyForecast.new(data)]
  end

  def get_forecast_for_city(latitude, longitude)
    DarkSkyService.new(latitude, longitude).forecast
  end
end
