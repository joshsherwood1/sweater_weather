require 'rails_helper'

describe "Register endpoint" do
  it "user can create account and receive access token" do

    post '/api/v1/users', :params => { "email" => "whatever@example.com", "password" => "password", "password_confirmation" => "password" }

    expect(response).to be_successful
    data = JSON.parse(response.body)
    expect(data.count).to eq(2)
    expect(data["status"]).to eq(201)
    expect(data["body"].keys).to eq(["api_key"])
    expect(data["body"].count).to eq(1)
  end

  it "user cannot create account when passwords do not match" do

    post '/api/v1/users', :params => { "email" => "whatever@example.com", "password" => "password", "password_confirmation" => "password123456" }

    expect(response).to be_successful
    data = JSON.parse(response.body)
    expect(data.count).to eq(2)
    expect(data["status"]).to eq(422)
    expect(data["body"]["msg"]).to eq("Password confirmation doesn't match Password")
  end

  it "user cannot create account when email has already been taken" do

    post '/api/v1/users', :params => { "email" => "whatever@example.com", "password" => "password", "password_confirmation" => "password" }
    post '/api/v1/users', :params => { "email" => "whatever@example.com", "password" => "password", "password_confirmation" => "password" }

    expect(response).to be_successful
    data = JSON.parse(response.body)
    expect(data.count).to eq(2)
    expect(data["status"]).to eq(422)
    expect(data["body"]["msg"]).to eq("Email has already been taken")
  end
end
