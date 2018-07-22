class StudentProgram < ApplicationRecord
  belongs_to :student
  belongs_to :program

  # validates :active, presence: true
	validates :student_id, presence: true
  validates :program_id, presence: true
  validates :start, presence: true
end
