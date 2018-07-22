class MemberDesignation < ApplicationRecord
  belongs_to :member
  belongs_to :designation

  # validates :active, presence: true
	validates :member_id, presence: true
  validates :designation_id, presence: true
  validates :start, presence: true
end
