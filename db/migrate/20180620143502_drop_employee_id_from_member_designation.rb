class DropEmployeeIdFromMemberDesignation < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :member_designations, :employee
  end
end
