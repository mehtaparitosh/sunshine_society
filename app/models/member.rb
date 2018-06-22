class Member < ApplicationRecord
	# belongs_to :designation

	has_many :member_designations

end
