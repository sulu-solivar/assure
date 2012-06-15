class Insurance < ActiveRecord::Base

	validates :carrier_name, :plan_name, :presence => true
	
	# relations
  belongs_to :plan
  belongs_to :user
  
end
