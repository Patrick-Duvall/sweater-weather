class Api::V1::BackgroundsController < ApplicationController

  def index
    serialized_images = BackgroundsIndexFacade.new(params).present_images
    render json: serialized_images
  end
end
