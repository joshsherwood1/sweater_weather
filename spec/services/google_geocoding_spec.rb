require 'rails_helper'

RSpec.describe 'google geocoding api service' do
  it 'returns latitude and longitude of a city' do
    location = "denver,co"
    service = GoogleGeocodingService.new(location)
    array_of_hashes_data = service.coordinates

    expect(service).to be_an_instance_of(GoogleGeocodingService)

    expect(array_of_hashes_data.first).to be_a(Array)
    expect(array_of_hashes_data).to have_key(:results)
    expect(array_of_hashes_data[:results].first[:geometry][:location]).to be_a(Hash)
    expect(array_of_hashes_data[:results].first[:geometry][:location][:lat]).to be_a(Float)
    expect(array_of_hashes_data[:results].first[:geometry][:location][:lng]).to be_a(Float)
  end
end
