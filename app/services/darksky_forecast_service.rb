class DarkskyForecastService

  def self.forecast(lat,lng)
    new.forecast(lat,lng)
  end

  def self.future_forecast(lat, lng, time)
    new.future_forecast(lat, lng, time)
  end

  def forecast(lat, lng)
    path = "/forecast/#{ENV['DARKSKY_API_KEY']}/#{lat},#{lng}"
    response = conn.get(path)
    JSON.parse(response.body)
  end

  def future_forecast(lat, lng, time)
    path = "/forecast/#{ENV['DARKSKY_API_KEY']}/#{lat},#{lng},#{time}"
    response = conn.get(path)
    JSON.parse(response.body)
  end

private
  def conn
    Faraday.new("https://api.darksky.net") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

end
