require 'rails_helper'

describe "Antipode request" do
  it "sends information about the antipode of a city" do

    get '/api/v1/antipode?location=hongkong'

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data["data"].first.count).to eq(3)
    expect(data["data"].first["attributes"].count).to eq(3)
    expect(data["data"].first["attributes"]["forecast"].count).to eq(2)
  end
end
