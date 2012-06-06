class Profile < ActiveRecord::Base

	# validations
	# validates :no_of_kids, :numericality => true

	belongs_to :user
	accepts_nested_attributes_for :user

	def score
		@max_score = 971
		@no_of_items = 18
		@item_score = (@max_score.to_f/@no_of_items.to_f).ceil
	end

	def work_score
		score
		partial_score = 0
		(partial_score += @item_score) if self.work.present?
		(partial_score += @item_score) if self.work_place.present?
		(partial_score += @item_score) if self.zip_code_or_city.present?
		return partial_score
	end

	def birthday_score
		score
		partial_score = 0
		(partial_score += @item_score) if self.birthday.present?
		return partial_score

	end

	def relationship_score
		score
		partial_score = 0
		(partial_score += @item_score) if self.relationship_status.present?
		(partial_score += @item_score) if self.related_to.present?
		(partial_score += @item_score) if self.no_of_kids.present?
		return partial_score

	end

	def living_score
		score
		partial_score = 0
		(partial_score += @item_score) if self.house_type.present?
		(partial_score += @item_score) if self.address.present?
		(partial_score += @item_score) if self.house_zip_code.present?
		return partial_score

	end

	def education_score
		score
		partial_score = 0
		(partial_score += @item_score) if self.education.present?
		(partial_score += @item_score) if self.university.present?
		(partial_score += @item_score) if self.degree.present?
		(partial_score += @item_score) if self.area_of_study.present?
		return partial_score
	end

	def car_score
		score
		partial_score = 0
		(partial_score += @item_score) if self.car_type.present?
		(partial_score += @item_score) if self.car_year.present?
		(partial_score += @item_score) if self.car_make.present?
		(partial_score += @item_score) if self.car_model.present?
		return partial_score
	end

	def total_score
		self.work_score + self.birthday_score + self.relationship_score + self.living_score + self.education_score + self.car_score
	end

	def profile_completion
		total_columns = Profile.columns.count - 0
		completed = 0
		Profile.columns.each do |c|
			(completed += 1) if self.try(c.name.to_sym).present?
		end
		filled_columns = completed - 0 # removing 0 columns because not filled by user
		filled_columns += 1
		return (filled_columns.to_f/total_columns.to_f)*100
	end

	def work_mood
		filled = 0
		(filled += 1) if self.work.present?
		(filled += 1) if self.work_place.present?
		(filled += 1) if self.zip_code_or_city.present?
		
		if filled == 0
			return 'red'
		elsif filled == 1 or filled == 2
			return 'yellow'
		elsif filled == 3
			return 'green'
		end
	end

	def birthday_mood
		filled = 0
		(filled += 1) if self.birthday.present?
		
		if filled == 0
			return 'red'
		elsif filled == 1
			return 'green'
		end
	end

	def relationship_mood
		filled = 0
		(filled += 1) if self.relationship_status.present?
		(filled += 1) if self.related_to.present?
		(filled += 1) if self.no_of_kids.present?

		if filled == 0
			return 'red'
		elsif filled == 1 or filled == 2
			return 'yellow'
		elsif filled == 3
			return 'green'
		end
	end

	def living_mood
		filled = 0
		(filled += 1) if self.house_type.present?
		(filled += 1) if self.address.present?
		(filled += 1) if self.house_zip_code.present?

		if filled == 0
			return 'red'
		elsif filled == 1 or filled == 2
			return 'yellow'
		elsif filled == 3
			return 'green'
		end
	end

	def education_mood
		filled = 0
		(filled += 1) if self.education.present?
		(filled += 1) if self.university.present?
		(filled += 1) if self.degree.present?
		(filled += 1) if self.area_of_study.present?

		if filled == 0
			return 'red'
		elsif filled == 1 or filled == 2
			return 'yellow'
		elsif filled == 3 or filled == 4
			return 'green'
		end
	end

	def car_mood
		filled = 0
		(filled += 1) if self.car_type.present?
		(filled += 1) if self.car_year.present?
		(filled += 1) if self.car_make.present?
		(filled += 1) if self.car_model.present?

		if filled == 0
			return 'red'
		elsif filled == 1 or filled == 2
			return 'yellow'
		elsif filled == 3 or filled == 4
			return 'green'
		end
	end
	
end
