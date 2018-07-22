class Designation < ApplicationRecord
	# has_many :employees
	# has_many :members
	has_many :employee_designations
	has_many :member_designations

	validates :comments, presence: true
	validates :name, presence: true
end
