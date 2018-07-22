class StudentSponsor < ApplicationRecord
  belongs_to :student
  belongs_to :sponsor

  # validates :active, presence: true
	validates :student_id, presence: true
  validates :sponsor_id, presence: true
  validates :start, presence: true
  validates :sponsor_type, presence: true
  validates :academic_year, presence: true
end
