class YelpService
  def initialize(arrival_time, destination, food_term)
    @arrival_time = arrival_time
    @destination = destination
    @food_term = food_term
  end

  def get_restaurants
    restaurants = conn.get do |req|
        req.url '/v3/businesses/search'
        req.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
        req.params['location'] = @destination
        req.params['limit'] = 3
        req.params['term'] = @food_term
        req.params['open_at'] = @arrival_time
      end
      restaurant_info = JSON.parse(restaurants.body)['businesses']
      restaurant_info.map{|info|Restaurant.new(info)}
  end

  private

  def conn

    conn = Faraday.new(:url => 'https://api.yelp.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end

  end


end
