class Api::V1::MunchiesController < ApplicationController
  def index

    google_directions_service = GoogleDirectionsService.new(params['start'], params['end'])
    google_directions_service.get_time

    directions_info = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{params['start']}&destination=#{params['end']}&key=#{ENV['GOOGLE_API_KEY']}")

    directions = JSON.parse(directions_info.body)
    time_to_travel = directions['routes'].first['legs'].first['duration']['value']
    current_time = Time.now.to_i
    arrival_time = time_to_travel + current_time

    yelp_service = YelpService.new(arrival_time, params['end'], params['food'])
    restaurants = yelp_service.get_restaurants

    serializer = RestaurantSerializer.new(params['end'], restaurants)
    serialized = serializer.present_restaurants

    render json: serialized
  end
end
