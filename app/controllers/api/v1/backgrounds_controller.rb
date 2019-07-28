class Api::V1::BackgroundsController < ApplicationController

  def index

    images = FlickrImageService.get_photos(params['location'])
    images_to_present = BackgroundImageSerializer.present_images(images)
    render json: images_to_present

  end

end
