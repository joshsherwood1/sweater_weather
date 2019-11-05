require 'rails_helper'

describe "Forecast API" do
  it "sends a weather information for specified city" do

    json_response = File.open('./spec/fixtures/google_data.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['GOOGLE_API_KEY']}").to_return(status: 200, body: json_response)

    json_response_2 = File.open('./spec/fixtures/weather_data.json')
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/39.7392358,-104.990251?exclude=minutely").to_return(status: 200, body: json_response_2)

    get '/api/v1/forecast?location=denver,co'

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
