class AntipodeSerializer
  def initialize(forecast_data, location, searched_city)
    @forecast_data = forecast_data
    @location = location
    @searched_city = searched_city
    binding.pry
  end

  def json
    {
         "data": [
             {
                 "id": "1",
                 "type": "antipode",
                 "attributes": {
                     "location_name": @location,
                     "forecast": {
                         "summary": @forecast_data.conditions,
                         "current_temperature": @forecast_data.temperature,
                                     },
                 "search_location": @searched_city
                 }
             }
         ]
     }
  end
end
