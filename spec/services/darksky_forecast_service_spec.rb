require "rails_helper"

describe "darksky forecast service" do

  before :each do
    @forecast = File.read('fixtures/forecast_denver_co.json')
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/39.7392358, -104.990251").with( body: @forecast)
    @forecast = DarkskyForecastService.forecast(39.7392358, -104.990251)
  end
  #TODO not use real API
  it ".forecast" do
    service = DarkskyForecastService.new
    @forecast = service.forecast(39.7392358, -104.990251)
    expect(@forecast['currently']).to be_a(Hash)
    expect(@forecast['currently']).to have_key('summary')
    expect(@forecast['hourly']).to be_a(Hash)
    expect(@forecast['hourly']).to have_key('summary')
    expect(@forecast['hourly']).to have_key('data')
    expect(@forecast['daily']).to be_a(Hash)
    expect(@forecast['daily']).to have_key('summary')
    expect(@forecast['daily']).to have_key('data')
  end
  it "#forecast" do
    @forecast = DarkskyForecastService.forecast(39.7392358, -104.990251)
    expect(@forecast['currently']).to be_a(Hash)
    expect(@forecast['currently']).to have_key('summary')
    expect(@forecast['hourly']).to be_a(Hash)
    expect(@forecast['hourly']).to have_key('summary')
    expect(@forecast['hourly']).to have_key('data')
    expect(@forecast['daily']).to be_a(Hash)
    expect(@forecast['daily']).to have_key('summary')
    expect(@forecast['daily']).to have_key('data')
  end

end
