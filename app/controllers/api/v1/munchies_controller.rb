class Api::V1::MunchiesController < ApplicationController
  def index

    google_directions_service = GoogleDirectionsService.new(params['start'], params['end'])
    arrival_time = google_directions_service.get_time

    yelp_service = YelpService.new(arrival_time, params['end'], params['food'])
    restaurants = yelp_service.get_restaurants

    serializer = RestaurantSerializer.new(params['end'], restaurants)
    serialized = serializer.present_restaurants

    render json: serialized
  end
end
