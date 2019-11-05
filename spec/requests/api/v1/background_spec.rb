require 'rails_helper'

describe "Background API" do
  it "sends url for a picture of specified city" do

    json_response = File.open('./spec/fixtures/picture_data.json')
    stub_request(:get, "https://api.unsplash.com/photos/random?client_id=#{ENV['UNSPLSH_ACCESS_KEY']}&query=Denver%20City%20Landscape").to_return(status: 200, body: json_response)

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data.count).to eq(1)
    expect(data["data"]["attributes"].count).to eq(1)
    expect(data["data"].count).to eq(2)
  end
end
