

require "rails_helper"

describe "road trip controller" do

  before :each do
    User.create(email: 'abc@gmail.com',
                password: 'a343',
                api_key: "jgn983hy48thw9begh98h4539h4")
  end

  it "returns a forcast for a destination" do
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
    expect(info['data']['attributes']['forecast_on_arrival']).to_not be_falsey
    expect(info['meta']['travel_time_to']).to_not be_falsey
    expect(info['data']['id']).to eq('1')
  end

  it "returns a 401 if no api_key" do
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO"
    }
    headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/road_trip', headers: headers, params: body.to_json
    expect(response.status).to eq(401)
  end

  it "returns a 401 if bad api_key" do
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "abc123"
    }
    headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
    }
    post '/api/v1/road_trip', headers: headers, params: body.to_json
    expect(response.status).to eq(401)
  end

end
