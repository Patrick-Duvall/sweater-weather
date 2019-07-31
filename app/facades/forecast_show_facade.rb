class ForecastShowFacade

  def initialize(params)
    @location = params['location']
  end

  def present_forecast
    city = get_city
     forecast= get_forecast(city)
    ForecastSerializer.present_forecast(forecast)
  end

private

  def get_city
    City.find_or_create_by(querystring: @location)
  end

  def get_forecast(city)
    weather = Rails.cache.fetch("forecast-#{@location}", expires_in: 15.minutes) do
      DarkskyForecastService.forecast(city.lat,city.lng)
    end
    Forecast.new(weather, @location)
  end

end
