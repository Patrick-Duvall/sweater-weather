require "rails_helper"

describe "Google Geocoding Service" do
  #TODO not use real API

  before :each do
    city_location = File.read('fixtures/denver_flicker_5_images.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver%2Cco&key=#{ENV['GOOGLE_API_KEY']}").with( body: city_location) 

  end

  it ".latlng" do
    service = GoogleGeocodingService.new
    expect(service).to be_a(GoogleGeocodingService)
    expect(service.latlng("denver,co")).to eq([39.7392358, -104.990251])
  end
  it "#latlng" do
    expect(GoogleGeocodingService.latlng("denver,co")).to eq([39.7392358, -104.990251])
  end


end
