class RegistrationsController < Devise::RegistrationsController

	def create
		super
		@user.create_profile!( :work => session[:work][:position][:name], :work_place => session[:work][:employer][:name], :zip_code_or_city => session[:work][:location][:name], :birthday => session[:birthday], :relationship_status => session[:relationship_status], :house_zip_code => session[:location], :education => 'graduate', :university => session[:college][:school][:name] )
		session[:omniauth] = nil unless @user.new_record?
	end

	private

	def build_resource (*args)
		super
		if session[:omniauth]
			@user.apply_omniauth session[:omniauth]

			# @user.valid?
		end
	end
end
