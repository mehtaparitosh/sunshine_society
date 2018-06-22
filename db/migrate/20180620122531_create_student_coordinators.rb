class CreateStudentCoordinators < ActiveRecord::Migration[5.2]
  def change
    create_table :student_coordinators do |t|
      t.boolean :active
      t.references :student, foreign_key: true
      t.references :coordinator, foreign_key: true

      t.timestamps
    end
  end
end
