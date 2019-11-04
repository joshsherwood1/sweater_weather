require 'rails_helper'

RSpec.describe 'dark sky api service' do
  it 'returns forecast' do
    latitude = "43.0731"
    longitude = "89.4012"
    service = DarkSkyService.new(latitude, longitude)
    array_of_hashes_data = service.forecast

    expect(service).to be_an_instance_of(DarkSkyService)

    expect(array_of_hashes_data.first).to be_a(Array)
    expect(array_of_hashes_data).to have_key(:currently)
    expect(array_of_hashes_data).to have_key(:timezone)
    expect(array_of_hashes_data).to have_key(:hourly)
    expect(array_of_hashes_data).to have_key(:daily)
    expect(array_of_hashes_data[:currently][:time]).to be_a(Integer)
    expect(array_of_hashes_data[:currently][:summary]).to be_a(String)
    expect(array_of_hashes_data[:hourly][:data].first[:summary]).to be_a(String)
    expect(array_of_hashes_data[:hourly][:data].first[:time]).to be_a(Integer)
    expect(array_of_hashes_data[:daily][:data].first[:time]).to be_a(Integer)
    expect(array_of_hashes_data[:daily][:data].first[:summary]).to be_a(String)
  end
end
