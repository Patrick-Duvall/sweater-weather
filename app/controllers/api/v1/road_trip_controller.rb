class Api::V1::RoadTripController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    if bad_api_key?(params['api_key'])
      render json: {"data":"Unauthorized Request"}, status: 401
    else
      time_info = GoogleDirectionsService.get_time(params['origin'], params['destination'])
      time = DirectionsTime.new(time_info)
      city = City.find_or_create_by(querystring: params['destination'])
      forecast_time = time.seconds.to_i + Time.now.to_i
      forecast_info = DarkskyForecastService.future_forecast(city.lat, city.lng, forecast_time)
      forecast = Forecast.new(forecast_info, params['destination'])
      forecast_to_present = RoadTripSerializer.present_forecast(forecast, time)
      render json: forecast_to_present, status: 200
    end
  end

  private

  def bad_api_key?(key)
    User.find_by(api_key: key).nil?
  end


end
