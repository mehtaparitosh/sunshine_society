class CreateStudentMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :student_mentors do |t|
      t.boolean :active
      t.references :student, foreign_key: true
      t.references :mentor, foreign_key: true

      t.timestamps
    end
  end
end
