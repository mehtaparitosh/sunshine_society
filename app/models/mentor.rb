class Mentor < ApplicationRecord
	# has_many :students
	has_many :student_mentors
	def collection_values
  	"#{men_id} : #{name}"
  end

	# validates :men_id, presence: true
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



end
