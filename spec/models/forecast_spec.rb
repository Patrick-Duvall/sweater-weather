require "rails_helper"
describe "forecast" do

  before :each do
    info = File.read('fixtures/weather_for_a_day_denver.json')
    @weather_info = JSON.parse(info)
    city = City.find_or_create_by(querystring: 'denver,co')
    @forecast = Forecast.new(@weather_info, city )
  end

  it "current_forecast" do
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
    expect(current['uv_index']).to eq("6, High")
    expect(current['summary']).to eq("Possible light rain this evening.")
  end

  describe "when " do

  end

  it "hourly forecast" do
    hourly = @forecast.hourly
    expect(hourly.count).to eq(8)
    expect(hourly[0]['hour']).to eq("1 PM")
    expect(hourly[1]['hour']).to eq("2 PM")
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

  it '.uv_index' do
    expect(@forecast.uv_index(1)).to eq("1, Low")
    expect(@forecast.uv_index(4)).to eq("4, Medium")
    expect(@forecast.uv_index(6)).to eq("6, High")
    expect(@forecast.uv_index(9)).to eq("9, Very High")
    expect(@forecast.uv_index(13)).to eq("13, Extremely High")
  end
  it '.hour_time' do
    expect(@forecast.hour_time(1564250400)).to eq("12 PM")
    expect(@forecast.hour_time(1564254000)).to eq("1 PM")
  end

end
