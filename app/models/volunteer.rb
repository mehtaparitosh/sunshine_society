class Volunteer < ApplicationRecord
	has_many :student_volunteers
	has_many :volunteer_schools
	def collection_values
  	"#{vol_id} : #{name}"
  end

	# validates :vol_id, presence: true
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
	validates :occupation, presence: true
	validates :days_available, presence: true


end
