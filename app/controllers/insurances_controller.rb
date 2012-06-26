class InsurancesController < ApplicationController

	respond_to :html, :json, :js

	def show
		@user = current_user
		@insurance = @user.insurances.find params[:id]
		respond_to do |format|
			format.js { }
		end
	end

	def update
		@user = current_user
		@insurance = @user.insurances.find params[:id]
		if @insurance
			@insurance.update_attributes params[:insurance]
			# respond_with @insurance
			respond_to do |format|
				format.js { }
				format.json { render :json => @insurance.as_json }
				format.html { }
			end
		end
	end

	def create
		@user = current_user
		@insurances = current_user.insurances
		if params[:insurance]
			@insurance = current_user.insurances.create params[:insurance]
			respond_to do |format|
				format.js {  }
				format.html {  }
			end
		end
	end

end