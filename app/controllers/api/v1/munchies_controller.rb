class Api::V1::MunchiesController < ApplicationController
  def index

    google_directions_service = GoogleDirectionsService.new(params['start'], params['end'])
    travel_time = google_directions_service.get_time
    arrival_time = travel_time + Time.now.to_i

    yelp_service = YelpService.new(arrival_time, params['end'], params['food'])
    restaurants = yelp_service.get_restaurants

    serializer = RestaurantSerializer.new(params['end'], restaurants)
    serialized = serializer.present_restaurants
    render json: serialized
  end
end
