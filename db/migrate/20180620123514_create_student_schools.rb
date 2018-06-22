class CreateStudentSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :student_schools do |t|
      t.boolean :active
      t.string :time_period
      t.string :academic_period
      t.text :fees

      t.timestamps
    end
  end
end
