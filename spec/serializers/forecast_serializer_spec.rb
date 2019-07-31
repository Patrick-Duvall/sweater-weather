require "rails_helper"

describe "ForecastSerializer " do
  it "#present_forecast" do
    info = File.read('fixtures/weather_for_a_day_denver.json')
    forecast_info = JSON.parse(info)
    forecast = Forecast.new(forecast_info, 'denver,co')
    result = ForecastSerializer.present_forecast(forecast)
    expect(result['data']['current']['summary']).to eq("Possible light rain this evening.")
    expect(result['data']['current']['brief_summary']).to eq("Mostly Cloudy")
    expect(result['data']['hourly'].count).to eq(8)
    expect(result['data']['daily'].count).to eq(5)
  end

  
end
