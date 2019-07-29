require "rails_helper"
describe "munchies api" do
  it "returns 3 restaurants in a destination city" do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'
    expect(response).to be_successful
    info = JSON.parse(response.body)
    expect(info['data']['city']).to eq('pueblo,co')
    expect(info['data']['restaurants'].count).to eq(3)
  end

end
