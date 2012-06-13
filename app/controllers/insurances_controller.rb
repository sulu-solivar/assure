class InsurancesController < ApplicationController

	respond_to :html, :json

	def update
		@insurance = current_user.insurances.find params[:id]
		if @insurance
			@insurance.update_attributes params[:insurance]
			respond_with @insurance
		end
	end

end