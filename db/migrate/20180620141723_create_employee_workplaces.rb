class CreateEmployeeWorkplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_workplaces do |t|
      t.boolean :active
      t.references :employee, foreign_key: true
      t.references :workplace, foreign_key: true

      t.timestamps
    end
  end
end
