class GoogleGeocodingService
  def initialize(data)
    @data = data
  end

  def coordinates
    parse_json(conn.get("", address: @data, key: ENV['GOOGLE_API_KEY']))
  end

  def location
    parse_json(conn.get("", latlng: "#{@data[:lat]},#{@data[:long]}",
                            key: ENV['GOOGLE_API_KEY'], result_type: "country"))
  end

  private

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
