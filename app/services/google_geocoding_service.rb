class GoogleGeocodingService
  def initialize(data)
    @data = data
  end

  def coordinates
    response = get_coordinate_data
    parse_json(response)
  end

  def location
    response = get_location_data
    parse_json(response)
  end

  private

  attr_reader :data

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_coordinate_data
    conn.get("", address: @data, key: ENV['GOOGLE_API_KEY'])
  end

  def get_location_data
    conn.get("", latlng: "#{@data[:lat]},#{@data[:long]}",
                            key: ENV['GOOGLE_API_KEY'], result_type: "country")
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
