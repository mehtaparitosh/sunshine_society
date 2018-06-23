class Member < ApplicationRecord
	# belongs_to :designation

	has_many :member_designations
	def collection_values
  	"#{mem_id} : #{name}"
  end
end
