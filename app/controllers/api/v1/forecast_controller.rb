class Api::V1::ForecastController < ApplicationController

  def show
    latlng = GoogleGeocodingService.latlng(params['location'])
    forecast_info = DarkskyForecastService.forecast(latlng[0],latlng[1])
    forecast = Forecast.new(forecast_info, params['location'])
    forecast_to_present = ForecastSerializer.present_forecast(forecast)
    render json: forecast_to_present, status: 200
  end

end
