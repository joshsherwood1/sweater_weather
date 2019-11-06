class GoogleGeocodingService
  def initialize(location)
    @location = location
  end

  def coordinates
    response = get_coordinates
    parse_json(response)
  end

  private
  attr_reader :location

  def get_coordinates
    Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |req|
      req.params["key"] = ENV['GOOGLE_API_KEY']
      req.params["address"] = @location
    end
  end
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
