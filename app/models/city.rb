class City < ApplicationRecord
  after_create :update_info


  private
  def update_info
    response = GoogleGeocodingService.get_city_info(querystring)
    city = response['results'].first['address_components'].first['long_name']
    state = response['results'].first['address_components'].third['short_name']
    country = response['results'].first['address_components'].fourth['short_name']
    lat = response['results'].first['geometry']['location']['lat']
    lng = response['results'].first['geometry']['location']['lng']
    self.update(city: city, state: state, country: country, lat:lat, lng:lng)
  end
end
