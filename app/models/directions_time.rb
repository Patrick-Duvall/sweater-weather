class DirectionsTime
  attr_reader :seconds, :time_string
  
  def initialize(info)
    @seconds = info['routes'].first['legs'].first['duration']['value']
    @time_string = info['routes'].first['legs'].first['duration']['text']
  end

end
