class School < ApplicationRecord
	# has_many :students
	has_many :student_shools
	has_many :volunteer_schools
end
