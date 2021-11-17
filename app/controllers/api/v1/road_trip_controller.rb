class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if user && params[:origin].present? && params[:destination].present? && !params[:api_key].nil?
      road_trip = RoadTripFacade.itinerary(params[:origin], params[:destination])
      render json: RoadTripSerializer.road_trip(road_trip), status: 200
    else
      render :json => { :errors => 'Unauthorized' }, :status => 401
    end
  end
end
