

require "rails_helper"

describe "users controller" do
  it "returns an API key" do
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
    headers = {
      'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/users', headers: headers, params: body.to_json
    expect(response.status).to eq(200)
    info = JSON.parse(response.body)
    expect(info['data']['attributes']['forecast']).to_not be_falsey
    expect(info['data']['attributes']['travel_time']).to_not be_falsey
  end
