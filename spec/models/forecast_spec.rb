require "rails_helper"
describe "forecast" do

  it "attributes" do
    info = File.read('fixtures/weather_for_a_day_denver.json')
    weather_info = JSON.parse(info)
    forecast = Forecast.new(info, 'denver,co')
    expect(forecast.city).to eq('Denver')
    expect(forecast.state).to eq('CO')
    expect(forecast.brief_summary).to eq('Mostly Cloudy')
    expect(forecast.temp).to eq(86.76)
    expect(forecast.temp_high).to eq(86.76)
    expect(forecast.temp_low).to eq(67.37)
    expect(forecast.feels_like).to eq(83.45)
    expect(forecast.humidity).to eq(0.28)
    expect(forecast.visibility).to eq(3.7)
    expect(forecast.uv_index).to eq(2)
    expect(forecast.summary).to eq("Possible light rain this evening.")


  end

end
