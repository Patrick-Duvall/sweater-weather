

require "rails_helper"

describe "weather forecast controller" do

  it "shows a summary" do
    post '/api/v1/users'
    require "pry"; binding.pry
    expect(response).to be_successful
    info = JSON.parse(response.body)
    #NOT JSON 1.0 BUT Follows spec example to a T
    expect(info['api_key']).to_not be_falsey

  end


end
