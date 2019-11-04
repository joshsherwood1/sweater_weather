class GoogleGeocodingService
  def initialize(location)
    @location = location
  end

  def coordinates
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |req|
      req.params["key"] = ENV['GOOGLE_API_KEY']
      req.params["address"] = @location
    end
    parse_json(response)
  end

  private
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
