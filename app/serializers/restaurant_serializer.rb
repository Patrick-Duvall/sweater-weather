class RestaurantSerializer

  def initialize(city, restaurants)
    @city = city
    @restaurants = restaurants
  end

  def present_restaurants
    {'data' => {
      'city' => @city,
      'restaurants' => restaurants_info
      }
    }
  end

  def restaurants_info
    @restaurants.map do |restaurant|
      {'name' => restaurant.name,
        'address' => restaurant.address
      }
    end
  end



end
