class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :st_id
      t.string :name
      t.string :gender
      t.date :dob
      t.date :doj
      t.string :contact_1
      t.string :contact_2
      t.string :contact_3
      t.string :email
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.boolean :active
      t.string :fathers_name
      t.string :fathers_occupation
      t.string :mothers_name
      t.string :mothers_occupation
      t.string :village_id
      t.string :society
      t.integer :school_id
      t.integer :program_id
      t.integer :support_id
      t.integer :mentor_id
      t.integer :sponsor_id

      t.timestamps
    end
  end
end
