class DestinationForecast
  attr_reader :temperature, :summary

  def initialize(data, hours_to_destination)
    @temperature = data[:hourly][:data][hours_to_destination][:temperature]
    @summary = data[:hourly][:data][hours_to_destination][:summary]
  end
end
