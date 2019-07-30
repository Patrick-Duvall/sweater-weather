class Api::V1::RoadTripController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    directions_service = GoogleDirectionsService.new(params['origin'], params['destination'])
    latlng = GoogleGeocodingService.latlng(params['origin'])
    travel_time = directions_service.get_time
    forecast_time = travel_time + Time.now.to_i
    forecast_info = DarkskyForecastService.future_forecast(latlng[0], latlng[1], forecast_time)
    forecast = Forecast.new(forecast_info, params['destination'])
    forecast_to_present = RoadTripSerializer.present_forecast(forecast)
    # forecast_to_present = ForecastSerializer.present_forecast(forecast)
    render json: forecast_to_present, status: 200
  end

end
