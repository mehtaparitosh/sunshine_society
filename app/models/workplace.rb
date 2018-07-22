class Workplace < ApplicationRecord
	# has_many :employees
	has_many :employee_workplaces

	validates :name, presence: true
	validates :address, presence: true
	validates :contact, presence: true
	validates :comments, presence: true


end
