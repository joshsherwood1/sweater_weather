require 'rails_helper'

RSpec.describe 'Unsplash service' do
  it 'returns picture url' do

    json_response = File.open('./spec/fixtures/picture_data.json')
    stub_request(:get, "https://api.unsplash.com/photos/random?client_id=#{ENV['UNSPLSH_ACCESS_KEY']}&query=Denver%20City%20Landscape").to_return(status: 200, body: json_response)

    location = "denver,co"
    service = UnsplashService.new(location)
    array_of_hashes_data = service.picture

    expect(service).to be_an_instance_of(UnsplashService)

    expect(array_of_hashes_data.first).to be_a(Array)
    expect(array_of_hashes_data).to have_key(:urls)
    expect(array_of_hashes_data[:urls]).to have_key(:raw)
    expect(array_of_hashes_data[:urls][:raw]).to be_a(String)
  end
end
