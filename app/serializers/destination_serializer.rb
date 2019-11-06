class DestinationSerializer
  def initialize(destination_object)
    @destination_object = destination_object
  end

  def json
    {
      data: {
        type: "destination information",
        id: 1,
        attributes: {
          travel_time: @destination_object.travel_time,
          destination_weather_summary: @destination_object.summary,
          destination_weather_temperature: @destination_object.temperature
        }
      }
    }
  end
end
