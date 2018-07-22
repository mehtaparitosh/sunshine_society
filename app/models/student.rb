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

	validates :st_id, presence: true
	validates :name, presence: true
	validates :gender, presence: true
	# validates :dob, presence: true
	validates :doj, presence: true
	validates :contact_1, presence: true
	validates :contact_2, presence: true
	validates :email, presence: true
	validates :address, presence: true
	validates :country, presence: true
	validates :pincode, presence: true
	# validates :active, presence: true
	validates :fathers_name, presence: true
	validates :fathers_occupation, presence: true
	validates :mothers_name, presence: true
	validates :mothers_occupation, presence: true
	validates :society, presence: true
	validates :category, presence: true
	validates :grade, presence: true


end
