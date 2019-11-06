class DarkSkyService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def forecast
    response = get_forecast
    parse_json(response)
  end

  private
  attr_reader :latitude, :longitude

  def get_forecast
    Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{@latitude},#{@longitude}") do |req|
      req.params["exclude"] = "minutely"
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
