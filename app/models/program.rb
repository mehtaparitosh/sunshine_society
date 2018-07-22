class Program < ApplicationRecord
	# has_many :students

	has_many :student_programs

	validates :name, presence: true
	validates :full_form, presence: true
	validates :comments, presence: true
end
