class FlickrImageService

  def get_photos(citystate)
    city = City.find_or_create_by(querystring: citystate)

    response =  conn.get do |req|
                  req.params['tags'] = "#{city.city},skyline,park"
                  req.params['lat'] = city.lat
                  req.params['lon'] = city.lng
                  req.params['radius'] = 1
                end
    JSON.parse(response.body)
  end

  def self.get_photos(citystate)
    new.get_photos(citystate)
  end

private
  def conn
    Faraday.new("https://api.flickr.com/services/rest") do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params['api_key'] = ENV['FLICKR_API_KEY']
      faraday.params['method'] = 'flickr.photos.search'
      faraday.params['content_type'] = 1
      faraday.params['extras'] = 'url_o'
      faraday.params['format'] = 'json'
      faraday.params['safe_search'] = '0'
      faraday.params['nojsoncallback'] = '1'
      faraday.params['tag_mode'] = 'all'
      faraday.params['per_page'] = 10
    end
  end

end
