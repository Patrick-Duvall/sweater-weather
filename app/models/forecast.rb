class Forecast
  attr_reader :city,
              :state,
              :brief_summary,
              :temp,
              :temp_high,
              :temp_low,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :summary
  def initialize(weather_info, cityState)
    @weather_info = weather_info
    @location = cityState
  end

  def current
    current = @weather_info
      {
        'city' => @location.split(',')[0].capitalize,
        'state' => @location.split(',')[1].upcase,
        'brief_summary' => @weather_info['currently']['summary'],
        'temp' => @weather_info['currently']['temperature'],
        'temp_high' => @weather_info['daily']['data'][0]['temperatureHigh'],
        'temp_low' => @weather_info['daily']['data'][0]['temperatureLow'],
        'feels_like' => @weather_info['currently']['temperature'] - @weather_info['currently']['windSpeed'],
        'humidity' => @weather_info['currently']['humidity'],
        'visibility' => @weather_info['currently']['visibility'],
        'uv_index' => @weather_info['currently']['uvIndex'],
        'summary' => @weather_info['hourly']['summary']
      }
  end

  def hourly
    hours = @weather_info['hourly']['data'][0..7]
    hours.map do |hour_info|
      {
        'hour' => Time.at(hour_info['time']).hour,
        'temperature' => hour_info['temperature'],
        'icon' => hour_info['icon']
      }
    end
  end

  def daily
    days = @weather_info['daily']['data'][0..4]
    days.map do |day_info|
      {
        'temp_low' => day_info['temperatureLow'],
        'temp_high' => day_info['temperatureHigh'],
        'icon' => day_info['icon'],
        'chance_precip' => day_info['precipProbability'],
      }
    end
  end

  # expect(daily[1]['temp_high']).to eq(88.64)
  # expect(daily[1]['temp_low']).to eq(62.77)
  # expect(daily[1]['icon']).to eq("partly-cloudy-day")
  # expect(daily[1]['chance_precip']).to eq(0.09)



end
