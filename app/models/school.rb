class School < ApplicationRecord
	# has_many :students
	has_many :student_shools
	has_many :volunteer_schools

	validates :name, presence: true
	validates :address, presence: true
	validates :contact_no, presence: true
	validates :contact_person, presence: true
	validates :contact_person_address, presence: true
	validates :contact_person_designation, presence: true
	validates :fees_type, presence: true
	validates :name_on_check, presence: true
	validates :board, presence: true
	validates :initial_class, presence: true
	validates :max_class, presence: true
	validates :comments, presence: true

end
