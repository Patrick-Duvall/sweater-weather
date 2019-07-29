require "rails_helper"
describe "forecast" do

  before :each do
    info = File.read('fixtures/weather_for_a_day_denver.json')
    @weather_info = JSON.parse(info)
    @forecast = Forecast.new(@weather_info, 'denver,co')
  end

  it "attributes" do
    current = @forecast.current
    expect(current['city']).to eq('Denver')
    expect(current['state']).to eq('CO')
    expect(current['brief_summary']).to eq('Mostly Cloudy')
    expect(current['temp']).to eq(86.76)
    expect(current['temp_high']).to eq(87.16)
    expect(current['temp_low']).to eq(67.37)
    expect(current['feels_like']).to eq(83.45)
    expect(current['humidity']).to eq(0.28)
    expect(current['visibility']).to eq(3.7)
    expect(current['uv_index']).to eq(6)
    expect(current['summary']).to eq("Possible light rain this evening.")
  end

  it "hourly forecast" do
    hourly = @forecast.hourly
    expect(hourly.count).to eq(8)
    expect(hourly[0]['hour']).to eq(13)
    expect(hourly[1]['hour']).to eq(14)
    expect(hourly[0]['temperature']).to eq(85.41)
    expect(hourly[1]['temperature']).to eq(86.86)
    expect(hourly[0]['icon']).to eq("partly-cloudy-day")
    expect(hourly[1]['icon']).to eq("partly-cloudy-day")
  end

  it 'daily forecast' do
    daily = @forecast.daily
    expect(daily.count).to eq(5)
    expect(daily[0]['temp_high']).to eq(87.16)
    expect(daily[1]['temp_high']).to eq(88.64)
    expect(daily[0]['temp_low']).to eq(67.37)
    expect(daily[1]['temp_low']).to eq(62.77)
    expect(daily[0]['icon']).to eq("rain")
    expect(daily[1]['icon']).to eq("partly-cloudy-day")
    expect(daily[0]['chance_precip']).to eq(0.43)
    expect(daily[1]['chance_precip']).to eq(0.09)
  end

end