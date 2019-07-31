require "rails_helper"

describe GoogleDirectionsService do
  before :each do
    directions = File.read('fixtures/denver_to_pueblo_directions.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/directions/json?origin=denver,co&destination=pueblo,co&key=#{ENV['GOOGLE_API_KEY']}").to_return( body: directions)
    @info = GoogleDirectionsService.get_time('denver,co','pueblo,co')
  end

  it "returns seconds" do
    expect(@info['routes'].first['legs'].first['duration']['value']).to eq(6413)
  end

  it "returns time string" do
    expect(@info['routes'].first['legs'].first['duration']['text']).to eq("1 hour 47 mins")
  end
end
