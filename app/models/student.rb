class Student < ApplicationRecord
	# belongs_to :school
	# belongs_to :program
	# belongs_to :support

	# belongs_to :mentor
	# belongs_to :sponsor
	# belongs_to :coordinator

	has_many :student_coordinators
	has_many :student_mentors
	has_many :student_programs
	has_many :student_schools
	has_many :student_sponsors
	has_many :student_supports
	has_many :student_volunteers


	def collection_values
  	"#{st_id} : #{name}"
  end
end
