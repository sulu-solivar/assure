class HomeController < ApplicationController

	before_filter :authenticate_user!, :except => [ :welcome, :guest ]

	def index
		@user = current_user
		if @user.profile.birthday.presence
			@birthday = @user.profile.birthday.strftime("%B %e, %Y")
		end
		@authentications = @user.authentications if current_user
		@insurances = current_user.insurances

		respond_to do |format|
			format.js {}
			format.html { render :index }
		end 
	end

	def welcome
		render :layout => 'dummy'
	end

	def guest
		render :partial => 'devise/sessions/temp'
	end

end