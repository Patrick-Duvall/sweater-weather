require "rails_helper"
describe "munchies api" do
  it "returns 3 restaurants in a destination city" do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'
    expect(response).to be_successful
    info = JSON.parse(response.body)
    # require "pry"; binding.pry
    expect(info['data']['destination']).to_not be_falsey
    expect(info['data']['restaurants'].count).to eq(3)

  end

end
