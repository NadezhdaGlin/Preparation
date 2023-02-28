class FacilitiesController < ApplicationController

	def index
		@facilities = Facility.all	
	end

	def new
		@facility = Facility.new
	end

	def create
		@facility = Facility.new(facilities_params)

		if @facility.save
			redirect_to @facility
		else
			render :new
		end
	end

	private
		def facilities_params
			params.require(:facility).permit(:name, :membercost, :guestcost, :initialoutlay, :monthlymaintenance)
		end
end
