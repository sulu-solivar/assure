class CustomAdmin::UsersController < ApplicationController

	before_filter :authenticate_user!

	def index
		@users = User.all
		unless current_user.email == 'venkat@solivar.com'
			redirect_to root_path
		end
	end

end
