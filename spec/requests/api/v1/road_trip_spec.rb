require 'rails_helper'

describe "Road trip endpoint" do
  it "user can create road trip and get weather information for destination city at time of arrival" do
    json_response = File.open('./spec/fixtures/google_route_data.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/directions/json?destination=Pueblo,CO&key=#{ENV['GOOGLE_API_KEY']}&origin=Denver,CO").to_return(status: 200, body: json_response)

    json_response_2 = File.open('./spec/fixtures/weather_data.json')
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/38.2542053,-104.6087488?exclude=minutely").to_return(status: 200, body: json_response_2)

    user = User.create!(email: "whatever@example.com", password: "password", api_key: 'sregbtw78nr78n87rr783fh')
    body = '{
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": "sregbtw78nr78n87rr783fh"
              }'

    post '/api/v1/road_trip', params: body

    expect(response).to be_successful
    data = JSON.parse(response.body)
    expect(data.count).to eq(1)
    expect(data["data"].count).to eq(3)
    expect(data["data"]["attributes"].count).to eq(3)
    expect(data["data"]["id"]).to eq(1)
  end

  it "user cannot create road trip and get weather information if they do not give correct api key" do
    WebMock.disable!
    user = User.create!(email: "whatever@example.com", password: "password", api_key: 'sregbtw78nr78n87rr783fh')
    body = '{
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": "s"
              }'

    post '/api/v1/road_trip', params: body

    expect(response).to be_successful
    data = JSON.parse(response.body)
    expect(data.count).to eq(2)
    expect(data["status"]).to eq(401)
    expect(data["body"]["msg"]).to eq("You are not authorized to view this page")
  end
end
