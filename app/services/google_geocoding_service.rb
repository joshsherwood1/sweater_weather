class GoogleGeocodingService
  def initialize(data)
    @data = data
  end

  def coordinates
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |req|
      req.params["key"] = ENV['GOOGLE_API_KEY']
      req.params["address"] = @data
    end
    parse_json(response)
  end

  def location
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |req|
      req.params["key"] = ENV['GOOGLE_API_KEY']
      req.params["latlng"] = "#{@data[:lat]},#{@data[:long]}"
      req.params["result_type"] = "country"
    end
    parse_json(response)
  end

  private
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
