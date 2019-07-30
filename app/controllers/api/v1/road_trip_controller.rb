class Api::V1::RoadTripController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    travel_time = GoogleDirectionsService.get_time(params['origin'], params['destination'])
    latlng = GoogleGeocodingService.latlng(params['origin'])
    forecast_time = travel_time + Time.now.to_i
    forecast_info = DarkskyForecastService.future_forecast(latlng[0], latlng[1], forecast_time)
    forecast = Forecast.new(forecast_info, params['destination'])
    forecast_to_present = RoadTripSerializer.present_forecast(forecast, travel_time)
    render json: forecast_to_present, status: 200
  end

end
