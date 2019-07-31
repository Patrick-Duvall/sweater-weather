class Api::V1::RoadTripController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    if bad_api_key?(params['api_key'])
      render json: {"data":"Unauthorized Request"}, status: 401
    else
      serialized = RoadTripShowFacade.new(params).present_forecast
      render json: serialized, status: 200
    end
  end

  private

  def bad_api_key?(key)
    User.find_by(api_key: key).nil?
  end
  
end
