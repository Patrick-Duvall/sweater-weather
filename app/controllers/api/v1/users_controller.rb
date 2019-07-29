class Api::V1::UsersController < ApplicationController

  def create
    if params["password"] != params['password_confirmation']
      render json: {"data": "Passwords do not match."}
    elsif User.find_by(email: params['email'])
      render json: {"data": "That email is in use."}
    else
    user = User.create(email: params['email'], password: params['password'])
    render json: {"api_key": user.api_key}
    end
  end

end
