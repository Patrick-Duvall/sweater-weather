class RoadTripShowFacade

  def initialize(params)
    @origin = params['origin']
    @destination = params['destination']
  end

def present_forecast
  time = get_time
  city = get_city
  forecast = get_weather(city, time)
  RoadTripSerializer.present_forecast(forecast, time)
end

  private

  def get_time
    time_info = GoogleDirectionsService.get_time(@origin, @destination)
    DirectionsTime.new(time_info)
  end

  def get_city
    City.find_or_create_by(querystring: @destination)
  end

  def get_weather(city, time)
    forecast_time = time.seconds.to_i + Time.now.to_i
    future_weather = DarkskyForecastService.future_forecast(city.lat, city.lng, forecast_time)
    Forecast.new(future_weather, @destination)
  end

end
