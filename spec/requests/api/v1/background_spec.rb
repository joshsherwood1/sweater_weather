require 'rails_helper'

describe "Weather API" do
  it "sends a list of customers" do

    get '/api/v1/backgrounds?location=denver,co'

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
