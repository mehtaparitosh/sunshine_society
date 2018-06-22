class Volunteer < ApplicationRecord
	has_many :student_volunteers
	has_many :volunteer_schools
end
