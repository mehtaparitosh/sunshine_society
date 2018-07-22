class StudentSupport < ApplicationRecord
  belongs_to :student
  belongs_to :support

  # validates :active, presence: true
	validates :student_id, presence: true
  validates :support_id, presence: true
  validates :start, presence: true
end
