require "rails_helper"

describe "users controller" do
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
end
