require "rails_helper"

describe "ForecastSerializer " do
  it "#present_images" do
    info = File.read('fixtures/weather_for_a_day_denver.json')
    forecast_info = JSON.parse(info)
    forecast = Forecast.new(forecast_info, 'denver,co')
    result = ForecastSerializer.present_forcast(forecast)
    expect(result['data']['currently']['summary']).to eq("Mostly Cloudy")
    expect(result['data']['hourly']).count.to eq(5)
    expect(result['data']['daily']).count.to eq(5)
  end
end
