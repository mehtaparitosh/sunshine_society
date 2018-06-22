class CreateEmployeeDesgnations < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_desgnations do |t|
      t.boolean :active
      t.references :employee, foreign_key: true
      t.references :designation, foreign_key: true

      t.timestamps
    end
  end
end
