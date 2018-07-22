class EmployeeWorkplace < ApplicationRecord
  belongs_to :employee
  belongs_to :workplace

  # validates :active, presence: true
	validates :employee_id, presence: true
  validates :workplace_id, presence: true
  validates :start, presence: true
end
