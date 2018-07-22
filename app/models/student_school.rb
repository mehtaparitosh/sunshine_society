class StudentSchool < ApplicationRecord
	belongs_to :student
	belongs_to :school

	# validates :active, presence: true
	validates :student_id, presence: true
  validates :school_id, presence: true
  validates :start, presence: true
	validates :time_period, presence: true
	validates :academic_period, presence: true
	validates :fees, presence: true
end
