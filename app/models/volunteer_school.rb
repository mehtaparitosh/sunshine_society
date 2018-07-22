class VolunteerSchool < ApplicationRecord
  belongs_to :school
  belongs_to :volunteer

  # validates :active, presence: true
	validates :volunteer_id, presence: true
  validates :school_id, presence: true
  validates :start, presence: true
end
