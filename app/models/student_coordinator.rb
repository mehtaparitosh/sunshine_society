class StudentCoordinator < ApplicationRecord
  belongs_to :student
  belongs_to :coordinator

  # validates :active, presence: true
	validates :student_id, presence: true
  validates :coordinator_id, presence: true
  validates :start, presence: true
end
