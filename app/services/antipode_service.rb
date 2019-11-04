class AntipodeService
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def coordinates
    response = Faraday.get("http://amypode.herokuapp.com/api/v1/antipodes") do |req|
      req.headers["api_key"] = ENV['AMY_PODE_KEY']
      req.params["lat"] = @coordinates[:lat]
      req.params["long"] = @coordinates[:lng]
    end
    parse_json(response)
  end

  private
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
