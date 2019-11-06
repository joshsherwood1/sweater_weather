require 'rails_helper'

RSpec.describe 'google route api service' do
  it 'returns travel time between two places' do
    origin = "denver,co"
    destination = "pueblo,co"

    json_response = File.open('./spec/fixtures/google_route_data.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?origin=#{origin}&destination=#{destination}&key=#{ENV['GOOGLE_API_KEY']}").to_return(status: 200, body: json_response)
    service = GoogleMapService.new(origin, destination)
    array_of_hashes_data = service.travel_time

    expect(service).to be_an_instance_of(GoogleMapService)

    expect(array_of_hashes_data.first).to be_a(Array)
    expect(array_of_hashes_data).to have_key(:routes)
    expect(array_of_hashes_data[:routes].first[:legs].first).to have_key(:duration)
    expect(array_of_hashes_data[:routes].first[:legs].first).to have_key(:end_location)
    expect(array_of_hashes_data[:routes].first[:legs].first[:duration]).to be_a(Hash)
    expect(array_of_hashes_data[:routes].first[:legs].first[:duration][:text]).to be_a(String)
    expect(array_of_hashes_data[:routes].first[:legs].first[:duration][:value]).to be_a(Integer)
    expect(array_of_hashes_data[:routes].first[:legs].first[:end_location]).to be_a(Hash)
    expect(array_of_hashes_data[:routes].first[:legs].first[:end_location][:lat]).to be_a(Float)
    expect(array_of_hashes_data[:routes].first[:legs].first[:end_location][:lng]).to be_a(Float)
  end
end
