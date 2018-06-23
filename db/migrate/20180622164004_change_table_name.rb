class ChangeTableName < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :employee_desgnations, :employee_designations
  end

  def self.down
    rename_table :employee_designations, :employee_desgnations
  end
end
