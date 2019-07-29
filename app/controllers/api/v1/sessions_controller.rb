class Api::V1::SessionsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    require "pry"; binding.pry
    user = User.find_by(email: params['email'])
    api_key = user.api_key
    #TODO findout If I need to make a sessionhere
    render json: {'api_key': api_key}
  end

  private
  params.permit(:email, :password)

end
