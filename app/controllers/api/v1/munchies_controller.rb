class Api::V1::MunchiesController < ApplicationController
  def index

    directions_info = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=denver,co&destination=pueblo,co&key=#{ENV['GOOGLE_API_KEY']}")

    directions = JSON.parse(directions_info.body)
    time_to_travel = directions['routes'].first['legs'].first['duration']['value']
    current_time = Time.now.to_i
    arrival_time = time_to_travel + current_time

    yelp_service = YelpService.new(arrival_time, params['end'], params['food'])
    restaurants = yelp_service.get_restaurants

    serializer = RestaurantSerializer.new(params['end'], restaurants)
    serialized = serializer.present_restaurants
    # conn = Faraday.new(:url => 'https://api.yelp.com') do |faraday|
    #   faraday.adapter  Faraday.default_adapter
    # end
    # restaurant_info = conn.get do |req|
    #   req.url '/v3/businesses/search'
    #   req.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
    #   req.params['location'] = params['end']
    #   req.params['limit'] = 3
    #   req.params['term'] = params['food']
    #   req.params['open_at'] = arrival_time
    # end


    # restaurants = JSON.parse(restaurant_info.body)
    # response = {"data" => {
    #   'destination' => params['end'],
    #   'restaurants' => restaurants['businesses']
    #             }
    #           }
    render json: serialized
  end
end
