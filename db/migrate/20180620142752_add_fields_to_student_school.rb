class AddFieldsToStudentSchool < ActiveRecord::Migration[5.2]
  def change
    add_reference :student_schools, :student, foreign_key: true
    add_reference :student_schools, :school, foreign_key: true
  end
end
