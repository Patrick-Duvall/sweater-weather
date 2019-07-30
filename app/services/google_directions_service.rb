class GoogleDirectionsService

  def self.get_time(start, stop)
    new.get_time(start, stop)
  end

  def get_time(start, stop)
    response = conn.get do |req|
      req.url '/maps/api/directions/json'
      req.params['origin'] = start
      req.params['destination'] = stop
    end
    directions = JSON.parse(response.body)
    DirectionsTime.new(directions)
  end

private
  def conn
    Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end
end
