class CreateVolunteerSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteer_schools do |t|
      t.boolean :active
      t.references :school, foreign_key: true
      t.references :volunteer, foreign_key: true

      t.timestamps
    end
  end
end
