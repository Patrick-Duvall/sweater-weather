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
    @city = cityState.split(',')[0].capitalize
    @state = cityState.split(',')[1].upcase
    @brief_summary = weather_info['currently']['summary']
    @temp = weather_info['currently']['temperature']
    @temp_high = weather_info['daily']['data'][0]['temperatureHigh']
    @temp_low = weather_info['daily']['data'][0]['temperatureLow']
    @feels_like = weather_info['currently']['temperature'] - weather_info['currently']['windSpeed']
    @humidity = weather_info['currently']['humidity']
    @visibility = weather_info['currently']['visibility']
    @uv_index = weather_info['currently']['uvIndex']
    @summary = weather_info['hourly']['summary']
  end



end
