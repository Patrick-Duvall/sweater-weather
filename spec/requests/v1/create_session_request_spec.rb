require "rails_helper"

describe "users controller" do
  it "returns an API key" do
    User.create(email: 'abc@123.com', password: 'abc123')
    body = {
      "email": "abc@123.com",
      "password": "abc123",
      'random': 'crap'
    }
    headers = {
      'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/sessions', headers: headers, params: body.to_json
    expect(response).to be_successful
    info = JSON.parse(response.body)
    expect(info['api_key']).to_not be_falsey
  end
end
