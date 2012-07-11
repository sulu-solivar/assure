class RegistrationsController < Devise::RegistrationsController

	def create
		super
		@user.create_profile!(
													:work => (session[:work].nil? or session[:work][:position].nil?) ? nil : session[:work][:position][:name],
													:work_place => (session[:work].nil? or session[:work][:employer].nil?) ? nil : session[:work][:employer][:name],
													:zip_code_or_city => (session[:work].nil? or session[:work][:location].nil?) ? nil : session[:work][:location][:name],
													:birthday => (session[:birthday].nil?) ? nil : session[:birthday],
													:relationship_status => (session[:relationship_status].nil?) ? nil : session[:relationship_status],
													:house_zip_code => (session[:location].nil?) ? nil : session[:location],
													:education => (session[:college].nil?) ? nil : 'graduate',
													:university => (session[:college].nil? or session[:college][:school].nil?) ? nil : session[:college][:school][:name]
												)
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
