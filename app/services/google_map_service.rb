class GoogleMapService
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def travel_time
    response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json") do |req|
      req.params["key"] = ENV['GOOGLE_API_KEY']
      req.params["origin"] = @origin
      req.params["destination"] = @destination
    end
    parse_json(response)
  end

  private
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
