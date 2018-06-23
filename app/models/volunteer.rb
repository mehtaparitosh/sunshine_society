class Volunteer < ApplicationRecord
	has_many :student_volunteers
	has_many :volunteer_schools
	def collection_values
  	"#{vol_id} : #{name}"
  end
end
