class ForecastFacade
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def get_forecast
    obtain_and_format_forecast
  end

  private

  def get_forecast_from_api(latitude, longitude)
    DarkSkyService.new(latitude, longitude).forecast
  end

  def obtain_and_format_forecast
    data = get_forecast_from_api(@coordinates[:lat], @coordinates[:lng])
    [CurrentWeather.new(data), Details.new(data), DailyForecast.new(data), HourlyForecast.new(data)]
  end
end
