class BackgroundsIndexFacade

  def initialize(params)
    @location = params['location']
  end

  def present_images
    images = get_images(@location)
    ImageSerializer.new(images).serialized_json
  end

  private

  def get_images(location)
    images_info = Rails.cache.fetch("images-#{location}", expires_in: 24.hours) do
      FlickrImageService.get_photos(params['location'])
    end
    images_info['photos']['photo'].map{|info| Image.new(info)}
  end

end
