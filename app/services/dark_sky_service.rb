class DarkSkyService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def forecast
    response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{@latitude},#{@longitude}") do |req|
      req.params["exclude"] = "minutely"
    end
    parse_json(response)
  end

  private
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
