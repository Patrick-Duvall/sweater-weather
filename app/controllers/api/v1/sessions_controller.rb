class Api::V1::SessionsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(email: params['email'])
    if user.nil? || !user.authenticate(params['password'])
      render json: {'data': "Bad Username or Password"}, status: 404
    else
      api_key = user.api_key
      render json: {'api_key': api_key}, status:200
    end
  end

end
