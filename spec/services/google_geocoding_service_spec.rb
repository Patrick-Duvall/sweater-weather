require "rails_helper"

describe "Google Geocoding Service" do
  #TODO not use real API
  it ".latlng" do
    service = GoogleGeocodingService.new
    expect(service).to be_a(GoogleGeocodingService)
    expect(service.latlng("denver,co")).to eq([39.7392358, -104.990251])
  end
  it "#latlng" do
    expect(GoogleGeocodingService.latlng("denver,co")).to eq([39.7392358, -104.990251])
  end


end
