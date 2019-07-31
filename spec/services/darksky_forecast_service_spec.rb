require "rails_helper"

describe "darksky forecast service" do

  before :each do
    forecast = File.read('fixtures/forecast_denver_co.json')
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/39.7392358,-104.990251").to_return( body: forecast)
    @forecast = DarkskyForecastService.forecast(39.7392358,-104.990251)
    require "pry"; binding.pry
    future_forecast = File.read('fixtures/new_york_future_forecast.json')
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/42.3601,-71.0589,1564584861").to_return( body: future_forecast)
    @future_forecast = DarkskyForecastService.future_forecast(42.3601, -71.0589, 1564584861)

  end

  it "#forecast" do
    @forecast = DarkskyForecastService.forecast(39.7392358, -104.990251)
    expect(@forecast['currently']).to be_a(Hash)
    expect(@forecast['currently']).to have_key('summary')
    expect(@forecast['currently']['temperature']).to eq(86.76)
    expect(@forecast['hourly']).to be_a(Hash)
    expect(@forecast['hourly']).to have_key('summary')
    expect(@forecast['hourly']).to have_key('data')
    expect(@forecast['daily']).to be_a(Hash)
    expect(@forecast['daily']).to have_key('summary')
    expect(@forecast['daily']).to have_key('data')
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



  # "temperatureHigh"=>92.47,
  #   "temperatureHighError"=>6.62,
  #   "temperatureHighTime"=>1564596000,
  #   "temperatureLow"=>70.76,

 #  "longitude"=>-71.0589,
 # "timezone"=>"America/New_York",
 # "currently"=>
 #  {"time"=>1564584861,
 #   "summary"=>"Partly Cloudy",
 #   "icon"=>"partly-cloudy-day",
 #   "precipIntensity"=>0.0015,
 #   "precipProbability"=>0.01,
 #   "precipType"=>"rain",
 #   "temperature"=>86.93,
 #   "apparentTemperature"=>90.46,
 #   "dewPoint"=>67.99,
 #   "humidity"=>0.53,
 #   "pressure"=>1015.88,
 #   "windSpeed"=>4.99,
 #   "windGust"=>9.66,
 #   "windBearing"=>233,
 #   "cloudCover"=>0.34,
 #   "uvIndex"=>6,
 #   "visibility"=>10,
 #   "ozone"=>308.4},
 # "hourly"=>


end
