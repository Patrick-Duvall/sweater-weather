

require "rails_helper"

describe "weather forecast controller" do



  it "shows a summary" do

    body = {
    "email": "whatever@example.com",
    "password": "password",
    "password_confirmation": "password"
    }

    headers = {'Content-Type': 'application/json',
    'Accept': 'application/json'}


  post '/api/v1/users', headers: headers, params: body.to_json
    expect(response).to be_successful
    info = JSON.parse(response.body)
    #NOT JSON 1.0 BUT Follows spec example to a T
    expect(info['api_key']).to_not be_falsey

  end

  # conn = Faraday.new(:url => '/api/v1/users') do |faraday|
  #   faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  # end


end
