class Member < ApplicationRecord
	# belongs_to :designation

	has_many :member_designations
	def collection_values
  	"#{mem_id} : #{name}"
  end

	# validates :mem_id, presence: true
	validates :name, presence: true
	validates :gender, presence: true
	# validates :dob, presence: true
	validates :doj, presence: true
	validates :contact, presence: true
	validates :email, presence: true
	validates :address, presence: true
	validates :country, presence: true
	validates :pincode, presence: true
	# validates :active, presence: true
	validates :effective_till, presence: true
	validates :kind, presence: true
	validates :voting_right, presence: true

end
