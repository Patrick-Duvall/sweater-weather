class GoogleDirectionsService

  def initialize(start, stop)
    @start = start
    @end = stop
  end

  def get_time
    response = conn.get do |req|
      req.url '/maps/api/directions/json'
      req.params['origin'] = @start
      req.params['destination'] = @end
    end
    directions = JSON.parse(response.body)
    time_to_travel = directions['routes'].first['legs'].first['duration']['value']
  end


private
  def conn
    Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
    end

  end

end
