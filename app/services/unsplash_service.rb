class UnsplashService
  def initialize(location)
    @location = location
  end

  def picture
    response = Faraday.get("https://api.unsplash.com/photos/random") do |req|
      req.params["client_id"] = ENV['UNSPLSH_ACCESS_KEY']
      req.params["query"] = "Denver City Landscape"
    end
    parse_json(response)
  end

  private
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
