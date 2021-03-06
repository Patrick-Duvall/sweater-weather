class Api::V1::ForecastController < ApplicationController

  def show
    serialized = ForecastShowFacade.new(params).present_forecast
    render json: serialized, status: 200
  end

end
