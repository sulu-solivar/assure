class Insurance < ActiveRecord::Base

	# relations
  belongs_to :plan
  belongs_to :user
  
end
