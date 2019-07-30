class RoadTripSerializer

  def self.present_forecast(forecast, time)
    {
      "meta":{
        "travel_time_to": time.time_string
      },
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
