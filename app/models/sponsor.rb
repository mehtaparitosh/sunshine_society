class Sponsor < ApplicationRecord
	# has_many :students
	has_many :student_sponsors
	def collection_values
  	"#{sp_id} : #{name}"
  end
end
