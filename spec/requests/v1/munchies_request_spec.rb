require "rails_helper"
describe "munchies api" do
  it "returns 3 restaurants in a destination city" do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'
    expect(response).to be_successful
    info = JSON.parse(response.body)
    # require "pry"; binding.pry
    expect(info['data']['city']).to eq('pueblo,co')
    expect(info['data']['restaurants'].count).to eq(3)
    expect(info['data']['restaurants'][0]['name']).to eq("Kan's Kitchen")
    expect(info['data']['restaurants'][0]['address']).to eq("1620 S Prairie Ave, Pueblo, CO 81005")

  end

end
