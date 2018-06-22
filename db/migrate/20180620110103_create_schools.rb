class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.text :address
      t.string :contact_no
      t.string :contact_person
      t.text :contact_person_address
      t.string :contact_person_designation
      t.string :fees_type
      t.string :name_on_check
      t.string :board
      t.string :initial_class
      t.string :max_class
      t.text :comments

      t.timestamps
    end
  end
end
