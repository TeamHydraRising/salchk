class DemographicsController < ApplicationController
	

	def index
		@demographics = Demographic.all
	end

	def new
		@demographic = Demographic.new
	end


end
