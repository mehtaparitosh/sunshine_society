class CreateStudentSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :student_sponsors do |t|
      t.string :academic_year
      t.string :sponsor_type
      t.boolean :active
      t.references :student, foreign_key: true
      t.references :sponsor, foreign_key: true

      t.timestamps
    end
  end
end
