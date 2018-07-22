class StudentMentor < ApplicationRecord
  belongs_to :student
  belongs_to :mentor

  # validates :active, presence: true
	validates :student_id, presence: true
  validates :mentor_id, presence: true
  validates :start, presence: true
end
