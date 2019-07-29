require "rails_helper"

describe GoogleDirectionsService do
  before :each do
    directions = File.read('fixtures/denver_to_co_directions.json')

    @service = GoogleDirectionsService.new('denver,co','pueblo,co')
    stub_request(:get, "https://maps.googleapis.com/maps/api/directions/json?origin=denver,co&destination=pueblo,co&key=#{ENV['GOOGLE_API_KEY']}").with( body: directions) 
  end

  it "returns seconds in unix" do
    expect(@service.get_time).to eq(6413)
  end

  end
