class Api::V1::ForecastController < ApplicationController

  def show
    city = City.find_or_create_by(query_string: params['location'])
    # latlng = GoogleGeocodingService.latlng(params['location'])
    forecast_info = DarkskyForecastService.forecast(city.lat,city.lng)
    forecast = Forecast.new(forecast_info, params['location'])
    forecast_to_present = ForecastSerializer.present_forecast(forecast)
    render json: forecast_to_present, status: 200
  end

end
