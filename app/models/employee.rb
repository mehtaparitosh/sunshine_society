class Employee < ApplicationRecord
	# belongs_to :desgnation
	# belongs_to :workplace

	has_many :employee_designations
	def collection_values
  	"#{em_id} : #{name}"
  end

	# validates :em_id, presence: true
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
	validates :designation, presence: true
	validates :education, presence: true
	validates :compensation, presence: true
	validates :cheque_name, presence: true

end
