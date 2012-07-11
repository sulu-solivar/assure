module ProfileHelper

	def relationships
		return [['Single','Single'], ['Committed','Committed'], ['Married','Married'], ['Complicated','Complicated'], ['In a relationship', 'In a relationship'] ]
	end
	
	def house_types
		[['own','own'], ['rent','rent']]
	end

	def car_types
		[['own','own'], ['rent','rent'], ['lease','lease']]
	end

end
