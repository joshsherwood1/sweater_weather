require 'rails_helper'

RSpec.describe 'Amypode api service' do
  it 'returns latitude and longitude of the antipode of given coordinates' do
    coordinates = {:lat=>22.3193039, :lng=>114.1693611}
    service = AntipodeService.new(coordinates)
    array_of_hashes_data = service.coordinates

    expect(service).to be_an_instance_of(AntipodeService)

    expect(array_of_hashes_data.first).to be_a(Array)
    expect(array_of_hashes_data).to have_key(:data)
    expect(array_of_hashes_data[:data]).to be_a(Hash)
    expect(array_of_hashes_data[:data][:attributes]).to be_a(Hash)
    expect(array_of_hashes_data[:data][:attributes][:lat]).to be_a(Float)
    expect(array_of_hashes_data[:data][:attributes][:long]).to be_a(Float)
  end
end
