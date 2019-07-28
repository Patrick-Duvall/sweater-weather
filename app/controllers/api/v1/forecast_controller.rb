class Api::V1::ForecastController < ApplicationController

  def show
    latlng = GoogleGeocodingService.latlng(params['location'])
    forecast = DarkskyForecastService.forecast(latlng[0],latlng[1])
    render json: {'data' => forecast}, status: 200
  end

end
