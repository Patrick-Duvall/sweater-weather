class Forecast
  def initialize(weather_info, city)
    @weather_info = weather_info
    @city = city
  end

  def current
    current = @weather_info
      {
        'city' => @city.city,
        'state' => @city.state,
        'country' => @city.country,
        'brief_summary' => @weather_info['currently']['summary'],
        'temp' => @weather_info['currently']['temperature'],
        'temp_high' => @weather_info['daily']['data'][0]['temperatureHigh'],
        'temp_low' => @weather_info['daily']['data'][0]['temperatureLow'],
        'feels_like' => feels_like,
        'humidity' => @weather_info['currently']['humidity'],
        'visibility' => @weather_info['currently']['visibility'],
        'uv_index' => uv_index,
        'summary' => @weather_info['hourly']['summary']
      }
  end

  def hourly
    hours = @weather_info['hourly']['data'][0..7]
    hours.map do |hour_info|
      {
        'hour' => hour_time(hour_info['time']),
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

private

def feels_like
  @weather_info['currently']['temperature'] - @weather_info['currently']['windSpeed']
end

def uv_index
  index = @weather_info['currently']['uvIndex']
  case index
  when 1..2
    "#{index}, Low"
  when 3..5
    "#{index}, Medium"
  when 6..7
    "#{index}, High"
  when 8..10
    "#{index}, Very High"
  else
    "#{index}, Extremely High"
  end
end

def hour_time(unix_time)
  time = Time.at(unix_time)
  time.strftime("%l %p")
end


end
