class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    if params["password"] != params['password_confirmation']
      render json: {"data": "Passwords do not match."}
    elsif User.find_by(email: params['email'])
      render json: {"data": "That email is in use."}
    else
    user = User.create(email: params['email'], password: params['password'])
    render json: {"api_key": user.api_key}, status: 201
    end
  end

end
