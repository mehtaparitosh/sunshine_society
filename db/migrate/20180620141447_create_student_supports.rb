class CreateStudentSupports < ActiveRecord::Migration[5.2]
  def change
    create_table :student_supports do |t|
      t.boolean :active
      t.references :student, foreign_key: true
      t.references :support, foreign_key: true

      t.timestamps
    end
  end
end
