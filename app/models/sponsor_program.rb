class SponsorProgram < ApplicationRecord
  belongs_to :sponsor
  belongs_to :program

  # validates :active, presence: true
	validates :sponsor_id, presence: true
  validates :program_id, presence: true
  validates :start, presence: true
end
