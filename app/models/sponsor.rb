class Sponsor < ApplicationRecord
	# has_many :students
	has_many :student_sponsors
	def collection_values
  	"#{sp_id} : #{name}"
  end

	# validates :sp_id, presence: true
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
	validates :sponsor_type, presence: true

end
