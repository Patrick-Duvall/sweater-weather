class ForecastSerializer

  def self.present_forecast(forecast)
    {
      'data' => {
        'current' => forecast.current,
        'hourly' => forecast.hourly,
        'daily' => forecast.daily
      }
    }
  end

end
