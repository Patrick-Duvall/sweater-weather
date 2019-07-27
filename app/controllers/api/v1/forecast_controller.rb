class Api::V1::ForecastController < ApplicationController


  def show
    latlng = GoogleGeocodingService.latlng(params['location'])
    conn = Faraday.new(:url => 'https://api.darksky.net/forecast/68d20c6de84d5448a56e180036ab5e62/39.7392358,-104.990251') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get

    render json: JSON.parse(response.body), status: 200
  end

end
