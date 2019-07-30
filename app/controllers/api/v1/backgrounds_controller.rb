class Api::V1::BackgroundsController < ApplicationController

  def index
    images_info = FlickrImageService.get_photos(params['location'])
    images = images_info['photos']['photo'].map{|info| Image.new(info)}
    serialized_images =  ImageSerializer.new(images).serialized_json
    render json: serialized_images
  end

end
