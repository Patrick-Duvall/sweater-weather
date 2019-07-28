require "rails_helper"

describe "weather forecast controller" do

  it "shows a summary" do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    info = JSON.parse(response.body)
    expect(info['data']['currently']).to_not be_falsey
    expect(info['data']['hourly']).to_not be_falsey
    expect(info['data']['daily']).to_not be_falsey

  end


end
