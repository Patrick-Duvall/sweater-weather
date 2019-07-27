require "rails_helper"

describe "Google Geocoding Service" do
  it "gets a lat/long from a city/state pair" do
    service = GoogleGeocodingService.new("denver,co")
    expect(service).to be_a(GoogleGeocodingService)
    expect(service.latlng).to eq([39.7392358, -104.990251])
  end

end
