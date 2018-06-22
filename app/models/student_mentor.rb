class StudentMentor < ApplicationRecord
  belongs_to :student
  belongs_to :mentor
end
