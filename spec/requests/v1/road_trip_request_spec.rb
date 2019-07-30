

require "rails_helper"

describe "road trip controller" do
  it "returns a forcst for a destination" do
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
    headers = {
      'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/road_trip', headers: headers, params: body.to_json
    expect(response).to be_successful
    info = JSON.parse(response.body)
    expect(info['data']['attributes']['forecast']).to_not be_falsey
    expect(info['data']['attributes']['travel_time']).to_not be_falsey
  end
end