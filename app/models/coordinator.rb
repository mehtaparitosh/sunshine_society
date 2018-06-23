class Coordinator < ApplicationRecord
	# has_many :students
	has_many :student_coordinators
	def collection_values
  	"#{co_id} : #{name}"
  end
end
