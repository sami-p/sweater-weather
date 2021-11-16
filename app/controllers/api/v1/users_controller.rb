class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.assign_api_key
      render json: UsersSerializer.user(user), status: 201
    else
      render :json => { :errors => 'Invalid email or password' }, :status => 409
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
