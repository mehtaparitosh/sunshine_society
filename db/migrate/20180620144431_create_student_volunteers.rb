class CreateStudentVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :student_volunteers do |t|
      t.boolean :active
      t.references :student, foreign_key: true
      t.references :volunteer, foreign_key: true

      t.timestamps
    end
  end
end
