class GoogleGeocodingService

  def initialize
  end

  def self.get_city_info(address)
    new.get_city_info(address)
  end

  def get_city_info(address)
    path = '/maps/api/geocode/json'
    params = {
      'address' => address,
      'key' => ENV['GOOGLE_API_KEY']
    }
    response = conn.get(path, params)
    JSON.parse(response.body)
  end

private
  def conn
    Faraday.new("https://maps.googleapis.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

end
