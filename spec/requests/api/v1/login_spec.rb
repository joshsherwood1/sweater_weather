require 'rails_helper'

describe "Login endpoint" do
  it "user can login and receive access token" do

    user = User.create!(email: "whatever@example.com", password: "password", api_key: 'sregbtw536878nr78n87rr783fh')
    login = '{
              "email": "whatever@example.com",
              "password": "password"
              }'

    post '/api/v1/sessions', params: login

    expect(response).to be_successful
    data = JSON.parse(response.body)
    expect(data.count).to eq(2)
    expect(data["status"]).to eq(201)
    expect(data["body"].keys).to eq(["api_key"])
    expect(data["body"].count).to eq(1)
  end

  it "user cannot login without registered email" do

    user = User.create!(email: "whateverasdfafaf@example.com", password: "password", api_key: 'sregbtw536878nr78n87rr783fh')
    login = '{
              "email": "whatever@example.com",
              "password": "password"
              }'

    post '/api/v1/sessions', params: login

    expect(response).to be_successful
    data = JSON.parse(response.body)
    expect(data.count).to eq(2)
    expect(data["status"]).to eq(422)
    expect(data["body"]["msg"]).to eq("Login information incorrect")
  end

  it "user cannot login without valid password" do

    user = User.create!(email: "whatever@example.com", password: "password", api_key: 'sregbtw536878nr78n87rr783fh')
    login = '{
              "email": "whatever@example.com",
              "password": "passwordd"
              }'

    post '/api/v1/sessions', params: login

    expect(response).to be_successful
    data = JSON.parse(response.body)
    expect(data.count).to eq(2)
    expect(data["status"]).to eq(422)
    expect(data["body"]["msg"]).to eq("Login information incorrect")
  end
end
