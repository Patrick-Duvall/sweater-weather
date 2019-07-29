

require "rails_helper"

describe "weather forecast controller" do
  it "returns an API key" do
    body = {
    "email": "whatever@example.com",
    "password": "password",
    "password_confirmation": "password"
    }
    headers = {
      'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/users', headers: headers, params: body.to_json
    expect(response).to be_successful
    info = JSON.parse(response.body)
    expect(info['api_key']).to_not be_falsey
  end

  it "doesn't work if passwords dont match" do
    body = {
    "email": "whatever@example.com",
    "password": "password",
    "password_confirmation": "pastword"
    }
    headers = {
      'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/users', headers: headers, params: body.to_json
    info = JSON.parse(response.body)
    expect(info['api_key']).to be_falsey
    expect(info['data']).to eq('Passwords do not match.')
  end

  it "doesn't work if email in use dont match" do
    User.create(email: "whatever@example.com", password: "anything")
    body = {
    "email": "whatever@example.com",
    "password": "password",
    "password_confirmation": "password"
    }
    headers = {
      'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/users', headers: headers, params: body.to_json
    info = JSON.parse(response.body)
    expect(info['api_key']).to be_falsey
    expect(info['data']).to eq('That email is in use.')
  end


end
