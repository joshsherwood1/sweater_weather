require 'rails_helper'

describe "Background API" do
  it "sends url for a picture of specified city", :vcr do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data.count).to eq(1)
    expect(data["data"]["attributes"].count).to eq(1)
    expect(data["data"].count).to eq(2)
  end
end
