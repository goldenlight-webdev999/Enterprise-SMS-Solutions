class Submission < ApplicationRecord

	def to_param
		uuid
	end
	
end
