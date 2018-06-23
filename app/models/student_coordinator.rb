class StudentCoordinator < ApplicationRecord
  belongs_to :student
  belongs_to :coordinator
  
end
