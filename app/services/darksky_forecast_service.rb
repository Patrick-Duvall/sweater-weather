class DarkskyForecastService

  def self.forecast(lat,lng)
    new.forecast(lat,lng)
  end

  def forecast(lat, lng)
    path = "/forecast/#{ENV['DARKSKY_API_KEY']}/#{lat},#{lng}"
    response = conn.get(path)
    info = JSON.parse(response.body)
    require "pry"; binding.pry
    {
      'currently' => info['currently'],
      'hourly' => info['hourly'],
      'daily' => info['daily']
    }
  end

private
  def conn
    Faraday.new("https://api.darksky.net") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

end
