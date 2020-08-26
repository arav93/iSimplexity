class TripsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def create
		@trip = Trip.new(trip_params)

	  if @trip.save
	  	@trip.choose_plan
	  	render json: { message: 'Success!' }
	  else
	  	render json: { errors: @trip.errors }, status: :unprocessable_entity
	  end
	end

	private 

	def trip_params
		params.require(:trip).permit!
	end
end
