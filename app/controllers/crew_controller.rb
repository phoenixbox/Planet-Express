class CrewController < ApplicationController
	respond_to :json

	def index
		@crew = Crew.all
	end

	def show
		@member = Crew.find params[:id]
	end

	def update
		@member = Crew.find params[:id]
		if @member.update_attributes params
			render "crew/show"
		else
			@member
		end
	end
end