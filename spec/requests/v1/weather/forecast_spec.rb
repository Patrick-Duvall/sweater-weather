require "rails_helper"

describe "weather forecast controller" do

  it "shows a summary" do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    expect(response['currently']).to_not be_falsey
  end
  it "shows hourly forecast" do
    expect(response).to be_successful
    expect(response['hourly']).to_not be_falsey

  end
  it "shows daily forecast" do
    expect(response).to be_successful
    expect(response['daily']).to_not be_falsey
  end

end
