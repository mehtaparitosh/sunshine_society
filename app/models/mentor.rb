class Mentor < ApplicationRecord
	# has_many :students
	has_many :student_mentors
	def collection_values
  	"#{men_id} : #{name}"
  end
end
