class StudentVolunteer < ApplicationRecord
  belongs_to :student
  belongs_to :volunteer

  # validates :active, presence: true
	validates :student_id, presence: true
  validates :volunteer_id, presence: true
  validates :start, presence: true
end
