class AntipodeSerializer
  def initialize(array = [])
    @forecast_data = array.first
    @location = array[1]
    @searched_city = array.last
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
