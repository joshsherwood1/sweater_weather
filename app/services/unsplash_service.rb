class UnsplashService
  def initialize(location)
    @location = location
  end

  def picture
    response = get_picture
    parse_json(response)
  end

  private
  attr_reader :location

  def get_picture
    Faraday.get("https://api.unsplash.com/photos/random") do |req|
      req.params["client_id"] = ENV['UNSPLSH_ACCESS_KEY']
      req.params["query"] = "Denver City Landscape"
    end
  end
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
