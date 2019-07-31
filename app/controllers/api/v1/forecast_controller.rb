class Api::V1::ForecastController < ApplicationController

  def show
    require "pry"; binding.pry
    serialized = ForecastShowFacade.new(params).present_forecast
    render json: serialized, status: 200
  end

end
