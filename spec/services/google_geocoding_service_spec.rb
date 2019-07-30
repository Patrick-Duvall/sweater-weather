require "rails_helper"

describe "Google Geocoding Service" do
  #TODO not use real API

  before :each do
    city_location = File.read('fixtures/denver_flicker_5_images.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver%2Cco&key=#{ENV['GOOGLE_API_KEY']}").with( body: city_location)
    @info = GoogleGeocodingService.get_city_info("denver,co")
  end

  # city = response['results'].first['address_components'].first['long_name']
  # state = response['results'].first['address_components'].third['short_name']
  # country = response['results'].first['address_components'].fourth['short_name']
  # lat = response['results'].first['geometry']['location']['lat']
  # lng = response['results'].first['geometry']['location']['lng']

  it "#get_city_info" do
    expect(@info['results'].first['address_components'].first['long_name']).to eq('Denver')
    expect(@info['results'].first['address_components'].third['short_name']).to eq('CO')
    expect(@info['results'].first['address_components'].fourth['short_name']).to eq('US')
    expect(@info['results'].first['geometry']['location']['lat']).to eq(39.7392358)
    expect(@info['results'].first['geometry']['location']['lng']).to eq(-104.990251)
  end


end
