class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    if passwords_not_equal?
      render json: {"data": "Passwords do not match."}, status: 404
    elsif User.email_in_use?(user_params['email'])
      render json: {"data": "That email is in use."}, status: 404
    else
    user = User.create(email: user_params['email'], password: user_params['password'])
    render json: {"api_key": user.api_key}, status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def passwords_not_equal?
    user_params["password"] != user_params['password_confirmation']
  end
end
