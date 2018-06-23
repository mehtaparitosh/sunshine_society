class EmployeeDesignation < ApplicationRecord
  belongs_to :employee
  belongs_to :designation
end
