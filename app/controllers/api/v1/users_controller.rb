class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(email: params['email'], password: params['password'])
    render json: {"api_key": user.api_key}
  end

end
