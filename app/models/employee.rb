class Employee < ApplicationRecord
	# belongs_to :desgnation
	# belongs_to :workplace

	has_many :employee_designations
end
