require "rails_helper"

describe "weather forecast controller" do

  it "provides a url" do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful
    info = JSON.parse(response.body)
    expect(info['data']['images']).to be_a(Array)
    expect(info['data']['images'][0]).to match('https')
    expect(info['data']['images'][4]).to match('https')

  end


end
