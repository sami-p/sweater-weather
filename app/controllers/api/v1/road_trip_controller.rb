class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if user && params[:origin].present? && params[:destination].present?
      road_trip = RoadTripFacade.itinerary(params[:origin], params[:destination])
      render json: RoadTripSerializer.road_trip(road_trip), status: 200
    end
  end
end
