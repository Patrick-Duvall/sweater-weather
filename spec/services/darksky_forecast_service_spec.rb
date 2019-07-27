require "rails_helper"

describe "darksky forecast service" do
  #TODO not use real API
  it ".forecast" do
    service = DarkskyForecastService.new
    forecast = service.forcast([39.7392358, -104.990251])
    expect(forecast['currently']).to be_a(Hash)
    expect(forecast['currently']).to have_key('summary')
    expect(forecast['hourly']).to be_a(Hash)
    expect(forecast['hourly']).to have_key('summary')
    expect(forecast['daily']).to be_a(Hash)
    expect(forecast['daily']).to have_key('summary')
  end

end
