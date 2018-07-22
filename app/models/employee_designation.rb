class EmployeeDesignation < ApplicationRecord
  belongs_to :employee
  belongs_to :designation

  # validates :active, presence: true
	validates :employee_id, presence: true
  validates :designation_id, presence: true
  validates :start, presence: true
end
