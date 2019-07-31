class Api::V1::BackgroundsController < ApplicationController

  def index
    images_info = Rails.cache.fetch("images-#{params['location']}", expires_in: 24.hours) do
      FlickrImageService.get_photos(params['location'])
    end
    images = images_info['photos']['photo'].map{|info| Image.new(info)}
    serialized_images =  ImageSerializer.new(images).serialized_json
    render json: serialized_images
  end
end
