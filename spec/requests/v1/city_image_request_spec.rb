require "rails_helper"

describe "weather forecast controller" do

  it "provides a url" do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful
    info = JSON.parse(response.body)
    expect(info['data']).to be_a(Array)
    expect(info['data'][0]['attributes']['address']).to match('https')
    expect(info['data'][1]['attributes']['address']).to match('https')
    expect(info['data'][0]['attributes']['alt']).to be_truthy
    expect(info['data'][1]['attributes']['alt']).to be_truthy
    expect(info['data'][0]['attributes']['id']).to be_truthy
    expect(info['data'][1]['attributes']['id']).to be_truthy

  end


end
