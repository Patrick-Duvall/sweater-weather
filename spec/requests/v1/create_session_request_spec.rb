require "rails_helper"

describe "users controller" do

  before :each do
    User.create(email: 'abc@123.com', password: 'abc123')
  end

  it "returns an API key" do
    body = {
      "email": "abc@123.com",
      "password": "abc123"
    }
    headers = {
      'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/sessions', headers: headers, params: body.to_json
    expect(response.status).to eq(200)
    info = JSON.parse(response.body)
    expect(info['api_key']).to_not be_falsey
  end

  it "errors on bad email" do
    body = {
      "email": "ab@123.com",
      "password": "abc123"
    }
    headers = {
      'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/sessions', headers: headers, params: body.to_json
    expect(response.status).to eq(404)
    info = JSON.parse(response.body)
    expect(info['data']).to eq('Bad Username or Password')
  end

  it "errors on bad user_email" do
    body = {
      "email": "abc@123.com",
      "password": "abc1234"
    }
    headers = {
      'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/sessions', headers: headers, params: body.to_json
    expect(response.status).to eq(404)
    info = JSON.parse(response.body)
    expect(info['data']).to eq('Bad Username or Password')
  end

end
