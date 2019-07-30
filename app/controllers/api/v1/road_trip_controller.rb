class Api::V1::RoadTripController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    service = GoogleDirectionsService.new(params['origin'], params['destination'])
    
    require "pry"; binding.pry
  end

end
