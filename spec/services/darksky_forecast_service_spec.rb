require "rails_helper"

describe "darksky forecast service" do

  before :each do
    forecast = File.read('fixtures/forecast_denver_co.json')
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/39.7392358,-104.990251").to_return( body: forecast)
    @forecast = DarkskyForecastService.forecast(39.7392358,-104.990251)
    future_forecast = File.read('fixtures/new_york_future_forecast.json')
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/42.3601,-71.0589,1564584861").to_return( body: future_forecast)
    @future_forecast = DarkskyForecastService.future_forecast(42.3601, -71.0589, 1564584861)
  end

  it "#forecast" do
    @forecast = DarkskyForecastService.forecast(39.7392358, -104.990251)
    expect(@forecast['currently']).to be_a(Hash)
    expect(@forecast['currently']['summary']).to eq("Mostly Cloudy")
    expect(@forecast['currently']['temperature']).to eq(86.76)
    expect(@forecast['currently']['windSpeed']).to eq(3.31)
    expect(@forecast['currently']['humidity']).to eq(0.28)
    expect(@forecast['currently']['visibility']).to eq(3.7)
    expect(@forecast['currently']['uvIndex']).to eq(6)
    expect(@forecast['hourly']['data'][0]['icon']).to eq("partly-cloudy-day")
    expect(@forecast['hourly']['data'][0]['time']).to eq(1564254000)
    expect(@forecast['hourly']['data'][0]['temperature']).to eq(85.41)
    expect(@forecast['hourly']['data'][1]['icon']).to eq("partly-cloudy-day")
    expect(@forecast['hourly']['data'][1]['time']).to eq(1564257600)
    expect(@forecast['hourly']['data'][1]['temperature']).to eq(86.86)
    expect(@forecast['daily']['data'][0]['summary']).to eq("Possible light rain in the evening.")
    expect(@forecast['daily']['data'][0]['temperatureHigh']).to eq(87.16)
    expect(@forecast['daily']['data'][0]['temperatureLow']).to eq(67.37)
    expect(@forecast['daily']['data'][0]['icon']).to eq('rain')
    expect(@forecast['daily']['data'][0]['precipProbability']).to eq(0.43)
    expect(@forecast['daily']['data'][1]['temperatureHigh']).to eq(88.64)
    expect(@forecast['daily']['data'][1]['temperatureLow']).to eq(62.77)
    expect(@forecast['daily']['data'][1]['icon']).to eq('partly-cloudy-day')
    expect(@forecast['daily']['data'][1]['precipProbability']).to eq(0.09)

  end

  it "#future_forecast" do
    expect(@future_forecast['currently']['summary']).to eq("Partly Cloudy")
    expect(@future_forecast['currently']['temperature']).to eq(86.93)
    expect(@future_forecast['daily']['data'][0]['temperatureHigh']).to eq(92.47)
    expect(@future_forecast['daily']['data'][0]['temperatureLow']).to eq(70.76)
    expect(@future_forecast['currently']['windSpeed']).to eq(4.99)
    expect(@future_forecast['currently']['humidity']).to eq(0.53)
    expect(@future_forecast['currently']['visibility']).to eq(10)
    expect(@future_forecast['currently']['uvIndex']).to eq(6)
    expect(@future_forecast['daily']['data'][0]['summary']).to eq("Partly cloudy throughout the day.")
  end

end
