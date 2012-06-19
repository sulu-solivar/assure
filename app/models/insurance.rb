class Insurance < ActiveRecord::Base

	validates :plan_id, :presence => true
	
	# relations
  belongs_to :plan
  belongs_to :user
  
end
