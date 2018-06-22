class EmployeeWorkplace < ApplicationRecord
  belongs_to :employee
  belongs_to :workplace
end
