class AddReferenceToMemberDesignation < ActiveRecord::Migration[5.2]
  def change
    add_reference :member_designations, :member, foreign_key: true
  end
end
