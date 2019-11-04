require 'rails_helper'

describe "Antipode request" do
  it "sends information about the antipode of a city" do

    get '/api/v1/antipode?location=hongkong'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data.count).to eq(3)
    expect(data["current_weather"].count).to eq(8)
    expect(data["details"].count).to eq(8)
    expect(data["forecast"].count).to eq(2)
    expect(data["forecast"]["hourly"].count).to eq(8)
    expect(data["forecast"]["daily"].count).to eq(5)
  end
end







# An antipode is the point on the planet that is diametrically opposite. You will create an API endpoint that takes a starting location and returns it's anitpode city along with the current weather temperature and summary for the antipode city.
#
# The endpoint should follow this format: /api/v1/antipode?location=<start_location_city_name>
#
# You will use the Amypode API to determine the antipode city for Hong Kong.
#
# Below is a sample request.
# [http://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82]
#
# The Amypode API requires header based authentication.
# - Pass your api key in as a header. Your header should be named api_key.
# - Your api key is: oscar_the_grouch
#
# Your endpoint will return:
# - the starting city name
# - the name of the antipode city
# - the current weather summary for the antipode city
#
# To look up the antipode city's name use Google's Geocoding API to perform a reverse lookup. The documentation is here: https://developers.google.com/maps/documentation/geocoding/start
#
# It would be a good idea to reuse the code you have currently written for retrieving weather data from the dark sky API.
#
# Your response format should be similar to the format below:
#
# {
#     "data": [
#         {
#             "id": "1",
#             "type": "antipode",
#             "attributes": {
#                 "location_name": "Antipode City Name",
#                 "forecast": {
#                     "summary": "Mostly Cloudy,
#                     "current_temperature": "72",
#                                 },
#             "search_location": "Hong Kong"
#             }
#         }
#     ]
# }
