class RoadTripSerializer

  def self.present_forecast(forecast)
    {
      "data": {
        "type": "forecast",
        "id": "1",
        "attributes": {
          'forecast_on_arrival': forecast.current
        }
      }
    }
  end

end
