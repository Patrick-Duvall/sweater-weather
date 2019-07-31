class Api::V1::ForecastController < ApplicationController

  def show
    city = City.find_or_create_by(querystring: params['location'])
    weather = Rails.cache.fetch("forecast-params#{['location']}", expires_in: 15.minutes) do
      DarkskyForecastService.forecast(city.lat,city.lng)
    end
    forecast = Forecast.new(weather, params['location'])
    forecast_to_present = ForecastSerializer.present_forecast(forecast)
    render json: forecast_to_present, status: 200
  end

end
