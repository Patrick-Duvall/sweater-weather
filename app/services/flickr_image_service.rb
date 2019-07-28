class FlickrImageService

  def get_photos(lat, lng, limit)
    response =  conn.get do |req|
                  req.params['lat'] = lat
                  req.params['lon'] = lng
                  req.params['per_page'] = limit
                end
    info = JSON.parse(response.body)
    require "pry"; binding.pry
  end

private
  def conn
    Faraday.new("https://api.flickr.com/services/rest") do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params['api_key'] = ENV['FLICKR_API_KEY']
      faraday.params['method'] = 'flickr.photos.search'
      faraday.params['content_type'] = 1
      faraday.params['tags'] = 'skyline,park'
      faraday.params['extras'] = 'url_o'
      faraday.params['format'] = 'json'
      faraday.params['safe_search'] = '0'
    end
  end

end
