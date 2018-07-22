class Support < ApplicationRecord
	# [has_many :students

	has_many :student_supports

	validates :name, presence: true
	validates :address, presence: true
	validates :contact, presence: true
	validates :comments, presence: true

end
