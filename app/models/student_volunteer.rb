class StudentVolunteer < ApplicationRecord
  belongs_to :student
  belongs_to :volunteer
end
