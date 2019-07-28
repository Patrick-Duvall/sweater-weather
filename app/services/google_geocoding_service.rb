class GoogleGeocodingService

  def initialize
  end

  def self.latlng(address)
    new.latlng(address)
  end

  def latlng(address)
    path = '/maps/api/geocode/json'
    params = {
      'address' => address,
      'key' => ENV['GOOGLE_API_KEY']
    }
    response = conn.get(path, params)
    info = JSON.parse(response.body)
    lat = info['results'].first['geometry']['location']['lat']
    lng = info['results'].first['geometry']['location']['lng']
    [lat,lng]
  end

private
  def conn
    Faraday.new("https://maps.googleapis.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

end
