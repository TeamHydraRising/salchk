class DemographicsController < ApplicationController
	

	def index
		@demographics = Demographic.all
	end

	def new
		@demographic = Demographic.new
	end

	def show
	end


	def edit
	end

	def create
    @demographic = Demographic.new(demographic_params)

    respond_to do |format|
      if @demographic.save
        format.html { redirect_to @demographic, notice: 'Your demographics have been added.' }
        format.json { render :show, status: :created, location: @demographic }
      else
        format.html { render :new }
        format.json { render json: @demographic.errors, status: :unprocessable_entity }
      end
    end
  end


end
