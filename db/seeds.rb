# Creating a guest account
guest = User.find_by_email('guest@sureify.com')
if guest == nil
	puts "Creating Guest Account"
	guest_user = User.create( :email => 'guest@sureify.com', :first_name => 'Guest', :last_name => 'User', :password => 'password', :password_confirmation => 'password' )
	guest_user.create_profile( :about => 'Lorem ipsum dolor sit amet' )
end

# Creating an admin user
if AdminUser.count == 0
	puts "Creating Admin account"
	AdminUser.create( :email => 'admin@suriefy.com', :password => 'password', :password_confirmation => 'password' )
end

# Creating isurance plans
if Plan.count == 0
	puts "Creating Plans"
	plans = [ 'Medical', 'Dental', 'Vision', 'Auto', 'Life', 'Home' ]

	plans.each do |p|
		Plan.create( :plan => p )
	end
end
