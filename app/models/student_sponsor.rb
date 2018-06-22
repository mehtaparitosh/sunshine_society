class StudentSponsor < ApplicationRecord
  belongs_to :student
  belongs_to :sponsor
end
