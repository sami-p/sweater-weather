class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: SessionsSerializer.session(user), status: 200
    else
      render :json => { :errors => "Invalid input" }, :status => 401
    end
  end
end
