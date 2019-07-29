require "rails_helper"

describe YelpService do
  before :each do
    restaurants = File.read('fixtures/first_3_restaurants_pueblo.json')
# require "pry"; binding.pry
    @service = YelpService.new( 1564422839,'pueblo,co', 'chinese')
    stub_request(:get, "https://api.yelp.com/v3/businesses/search?term=chinese&location=pueblo,co&limit=3&open_at=1564420946").with( body: restaurants)
  end

    it "returns 3 restaurants" do
      restaurants = @service.get_restaurants
      expect(restaurants[0].name).to eq("Kan's Kitchen")
      expect(restaurants[0].address).to eq("1620 S Prairie Ave, Pueblo, CO 81005")
      expect(restaurants[2].name).to eq("Kuan's Kitchen")
      expect(restaurants[2].address).to eq("750 Desert Flower Blvd, Pueblo, CO 81001")

    end

  end
