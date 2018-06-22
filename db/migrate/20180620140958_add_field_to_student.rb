class AddFieldToStudent < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :coordinator, foreign_key: true
  end
end
